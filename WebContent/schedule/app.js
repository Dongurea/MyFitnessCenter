
// our radial components and an array to hold them
var viz1,viz2,viz3,vizs=[];

// our radial themes and an array to hold them
var theme1,theme2,theme3,themes;

// our div elements we will put radials in
var div1Js,div2Js,div3Js,divJss;
var div1,div2,div3,divs;

// show reel for demo only;
var reels=[];

function initialize() {

    //Here we use the three div tags from our HTML page to load the three components into.
    div1 = d3.select("#div1");
    div1Js = document.getElementById("div1");
    div2 = d3.select("#div2");
    div2Js = document.getElementById("div2");
    
    //Store the divs in an array for easy access
    divs=[div1,div2];
    divJss=[div1Js,div2Js];

    //Here we create our three radial progress components by passing in a parent DOM element (our div tags)
    viz1 = vizuly.viz.radial_progress(document.getElementById("div1"));
    viz2 = vizuly.viz.radial_progress(document.getElementById("div2"));
    //Store the vizs in an array for easy access
    vizs=[viz1,viz2];


    //Here we create three vizuly themes for each radial progress component.
    //A theme manages the look and feel of the component output.  You can only have
    //one component active per theme, so we bind each theme to the corresponding component.
    theme1 = vizuly.theme.radial_progress(viz1).skin(vizuly.skin.RADIAL_PROGRESS_NEON);
    theme2 = vizuly.theme.radial_progress(viz2).skin(vizuly.skin.RADIAL_PROGRESS_NEON);
    themes=[theme1,theme2];

    //Like D3 and jQuery, vizuly uses a function chaining syntax to set component properties
    //Here we set some bases line properties for all three components.
    vizs.forEach(function (viz,i) {
        viz.data(10)                       // Current value
            .height(0)                    // Height of component - radius is calculated automatically for us
            .min(0)                         // min value
            .max(100)                       // max value
            .capRadius(1)                   // Sets the curvature of the ends of the arc.
            .on("tween",onTween)            // On the arc animation we create a callback to update the label
            .on("mouseover",onMouseOver)    // mouseover callback - all viz components issue these events
            .on("mouseout",onMouseOut)      // mouseout callback - all viz components issue these events
            .on("click",onClick)           // mouseout callback - all viz components issue these events
            
            // Now we set some unique properties for all three components to demonstrate the different settings.
            .startAngle(210)
            .endAngle(150)
            .arcThickness(.11)
            .label(function (d,i) { return d3.format(".0f")(d) + "%"; });
    })

    //We use this function to size the components based on the selected value from the RadiaLProgressTest.html page.
    changeSize();

}

//Here we want to animate the label value by capturin the tween event
//that occurs when the component animates the value arcs.
function onTween(viz,i) {
    viz.selection().selectAll(".vz-radial_progress-label")
        .text(viz.label()(viz.data() * i));
}

function onMouseOver(viz,d,i) {
    //We can capture mouse over events and respond to them
}

function onMouseOut(viz,d,i) {
    //We can capture mouse out events and respond to them
}

function onClick(viz,d,i) {
    //We can capture click events and respond to them
}

//---------------------------------------------------------
//
//  The following functions are triggered by the user making changes in the settings panel which is declared in the
//  RadialProgressTest.html file.
//
//---------------------------------------------------------

//This sets the same value for each radial progress
function changeData(val) {
    vizs.forEach(function (viz,i) {
        vizs[i].data(Number(val)).update();
    })
}
function changeSize() {
	var divwidth;
	var divheight;
    divs.forEach(function (div,i) {
    	divwidth = divJss[i].clientWidth;
    	divheight = divJss[i].clientHeight;
    	var half=500;
        div.style("height", divwidth ).style("margin-top", "20px");
        vizs[i].width(10).height(10).radius(divwidth/2.2).update();
        vizs[i].margin({top:divwidth,bottom:0,left:0,right:0}).update();
    })

}