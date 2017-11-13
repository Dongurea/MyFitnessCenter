const MIBAND_SERVICE_UUID = 0xFEE0;
const BATTERY_INFO_UUID = 0xFF0C;
const STEPS_UUID = 0xFF06;
const DEVICE_INFO_UUID = 0xFF01;
const CONTROL_POINT_UUID = 0xFF05;
const BLE_CONNECTION_PARAMETERS_UUID = 0xFF09;

const batteryStatus=[
	"BatteryInfo",
	"Battery low",
	"Battery charging",
	"Battery full",
	"Not charging"
]
const services = {
  alertService: {
    name: 'alert service',
    uuid: '00001802-0000-1000-8000-00805f9b34fb'
  },
  heartService : {
    name: 'heart service',
    uuid: '0000180d-0000-1000-8000-00805f9b34fb'
  },
  miband: {
    name: 'miband service',
    uuid: '0000fee0-0000-1000-8000-00805f9b34fb'
  }
}

const characteristics = {
  alertCharacteristic: {
    name: 'alert characteristic',
    uuid: '00002a06-0000-1000-8000-00805f9b34fb'
  },
  heartControl:{
    name: 'heart control characteristic',
    uuid: '00002a39-0000-1000-8000-00805f9b34fb'
  },
  heartMeasurement:{
    name: 'heart measurement characteristic',
    uuid: '00002a37-0000-1000-8000-00805f9b34fb'
  },
  battery:{
    name: 'battery characteristic',
    uuid: '0000ff0c-0000-1000-8000-00805f9b34fb'
  },
  realtimeSteps:{
    name: 'realtimeSteps characteristic',
    uuid: '0000ff06-0000-1000-8000-00805f9b34fb'
  },
  activityDatas:{
    name: 'activityDatas characteristic',
    uuid: '0000ff07-0000-1000-8000-00805f9b34fb'
  },
  descUpdate:{
    name: 'descriptor update notification',
    uuid: '00002902-0000-1000-8000-00805f9b34fb'
  },
  userInfo:{
    name: 'userInfo characteristic',
    uuid: '0000ff04-0000-1000-8000-00805f9b34fb'
  }
}

var _this;
var state = {};
var previousPose;

class Miband{
  constructor(name){
    _this = this;
    this.name = name;
    this.services = services;
    this.characteristics = characteristics;
    
    this.isConnected=false;
   
    this._characteristics = new Map();
    this._primaryService;
    this.server;
    this.service;
    this.characteristic;
    this.device;
    this.steps;
    this.batterydata;
    this.activities;
  }

  connect(){
    return navigator.bluetooth.requestDevice({
      filters: [
        {name: [this.name]},
        {services: [services.alertService.uuid,services.miband.uuid,
        			MIBAND_SERVICE_UUID,
        			BATTERY_INFO_UUID,STEPS_UUID,CONTROL_POINT_UUID,
        			BLE_CONNECTION_PARAMETERS_UUID]}
      ]
    })
    .then(device => {
      this.device=device;
      device.addEventListener('gattserverdisconnected', onDisconnected);
      return device.gatt.connect();
    })
    .then(server => {
      this.server = server;
      this.isConnected=true;
      return server.getPrimaryService(MIBAND_SERVICE_UUID)
    })
    .then(service => {
      this._primaryService = service;
      return Promise.all(this._saveAllCharacteristics(service))
      .then(() => true)
    })
    .catch(error => {alert(error);})
  }

  _saveAllCharacteristics(service){
	    return [
	      this._saveCharacteristic(service, BATTERY_INFO_UUID),
	      this._saveCharacteristic(service, services.alertService.uuid)
	    ]
  }
  _saveCharacteristic(service, characteristicUUID) {
    return this._primaryService.getCharacteristic(characteristics.battery.uuid)
    .then(characteristic => {
      this._characteristics.set(characteristicUUID, characteristic);
    })
    .catch(exception => {
      console.error(exception);
    });
  }
  immidiateAlert(device){
	  let alertService = services.alertService;
      let commandChar = characteristics.alertCharacteristic;
	  let commandValue = new Uint8Array([0x01,0x02]);
	  return device.gatt.connect().then(server => {
		  this.server = server;
		  return true;
	  })
	  .then(result => {
		  //alert("Reconnected!");
	      // Before having access to IMU, EMG and Pose data, we need to indicate to the Myo that we want to receive this data.
	      return this.server.getPrimaryService(alertService.uuid)
	  })
      .then(service => {
        //alert('getting service: '+alertService.name);
        return service.getCharacteristic(commandChar.uuid);
      })
      .then(characteristic => {
        //alert('getting characteristic: '+commandChar.name);
        //alert('got characteristic: '+characteristic);
        // return new Buffer([0x01,3,emg_mode,imu_mode,classifier_mode]);
        // The values passed in the buffer indicate that we want to receive all data without restriction;
        characteristic.writeValue(commandValue);
      })
      .catch(error =>{
        alert(error);
      })
  }
  setUserData(){
	  let mibandService = services.miband;
	  let commandChar = characteristics.userInfo;
	  let commandValue = new Uint8Array([121,(121>> 8 & 0xff),(121>> 16 & 0xff),(121>> 24 & 0xff),0,170,60,0,4,0,8]);
	  /*
	   * 3009317516 ::hashcode:31,49,27,49,5
	   * C80:F10:5CC:5FD
	    Byte[0-3] --> user ID
		Byte[4] --> gender (0:female, 1:male)
		Byte[5] --> age
		Byte[6] --> height
		Byte[7] --> weight
		Byte[8-11] --> alias
	  */
	  return this.server.getPrimaryService(mibandService.uuid)
	  .then(service => {
		  this.service=service;
		  return service.getCharacteristic(commandChar.uuid);
      })
      .then(characteristic => {
        //alert('got characteristic: '+commandChar.name);
        this.characteristic=characteristic;
        return characteristic.readValue();
      })
      .then(result=>{
    	  //alert("1");
    	  this.characteristic.writeValue(commandValue);
    	  return true
      })
      .catch(error =>{
        alert(error);
      })
	  /*
	  .then(userdata=>{
    	  alert("GOT USER DATA: "+userdata);
    	  alert("FEMALE:"+userdata.getUint8(4));
    	  alert("AGE:"+userdata.getUint8(5));
    	  return true;
      })
	   * */
  }
  notifyHeartrate(){
	  let heartService = services.heartService;
      let commandChar = characteristics.heartMeasurement;
      let commandNotify = characteristics.heartMeasurement;
	  let commandValue = new Uint8Array([21, 2, 1]);
	  //21,2,1 -> 1번 / 21,1,1 ->약 10번
	  alert("NOTIFY");
	  return this.server.getPrimaryService(heartService.uuid)
	  .then(service=>{
		  this.service=service;
		  return this.service.getCharacteristic(commandChar.uuid)
	  })
      .catch(error =>{
        alert(error);
      })
  }
  handleHeartRate(event){
	  let value = event.target.value;
	  let a = [];
  	//if (data.length == 2 && data[0] == 6) {
    // int heartRate = data[1] & 0xFF;
    //listener.onNotify(heartRate);
	  var heartRate = value.getUint8(1).toString(16)
	  alert('NOTIFY> ' + heartRate);
  }
  getSteps(device){
	  let mibandService = services.miband;
	  let commandChar = characteristics.realtimeSteps;

	  //alert("Start For getSteps!");
	  return this.server.getPrimaryService(mibandService.uuid)
      .then(service => {
        //alert('getting service: '+mibandService.name);
        return service.getCharacteristic(commandChar.uuid);
      })
      .then(characteristic => {
        //alert('getting characteristic: '+commandChar.name);
        //alert('got characteristic: '+characteristic);
	    return characteristic.readValue()
      })
      .then(data =>{
    	 this.steps=data.getUint8(0) | (data.getUint8(1) << 8) |
          (data.getUint8(2) << 16) | (data.getUint8(3) << 24);
    	 //alert("[miband-step]: "+this.steps);
    	 //document.getElementById("steps").innerText=this.steps+" steps";
    	 return true;
      })
      .catch(error =>{
	        //alert("getSteps!!: "+ error);
      });
  }
  getBatteryData(){
	  let mibandService = services.miband;
	  let commandChar = characteristics.battery;
	  
	  //alert("Start For getBatteryData!");
	  return this.server.getPrimaryService(mibandService.uuid)
      .then(service => {
        //alert('getting service: '+mibandService.name);
        return service.getCharacteristic(commandChar.uuid);
      })
      .then(characteristic => {
        //alert('getting characteristic: '+commandChar.name);
        //alert('got characteristic: '+characteristic);
	    return characteristic.readValue()
      })
      .then(data =>{
			this.batterydata=[
				data.getUint8(0),batteryStatus[data.getUint8(9)]
				];
			return true;
      })
      .catch(error =>{
	        //alert("FAIL to get Steps!!: "+ error);
      });
  }
  getActivityDatas(){
	  let mibandService = services.miband;
	  let commandChar = characteristics.activityDatas;
	  
	  alert("Start For getActivityData!");
	  return this.server.getPrimaryService(mibandService.uuid)
      .then(service => {
        alert('getting service: '+mibandService.name);
        return service.getCharacteristic(commandChar.uuid);
      })
      .then(characteristic => {
        alert('getting characteristic: '+commandChar.name);
        alert('got characteristic: '+characteristic);
        alert('check READ: '+characteristic.properties.read);
        alert('check NOTIFY: '+characteristic.properties.notify);
        return characteristic.startNotifications().then(_ => {
            log('> Notifications started');
            characteristic.addEventListener('characteristicvaluechanged',
                handleNotifications);
          });
      })
      .then(data =>{
    	  alert(data);
    	  return false
      })
     /*

      .then(data =>{
    	  alert("[Activity]");
    	  alert(data.getUint8(0));
    	  //Byte[0] --> category (126 --> run)
    	  //Byte[1] --> intensity
    	  //Byte[2] --> steps
    	  //this.activities;
		  return true;
      })
      * */
      .catch(error =>{
	        alert("FAIL to get ActivityData: "+ error);
      });
  }
  
  
  getStep(){
	  return this.steps;
  }
}
var miband=new Miband("MI1S");

function onDisconnected(event) {
	  let device = event.target;
	  //alert('Device ' + device.name + ' is disconnected.');
	  this.isConnected=false;
	  /*
	  device.gatt.connect()
	  .then(server => {
	    miband.server = server;
	  })
	  .catch(error =>{
	        alert(error);
	  });
	   * */
}