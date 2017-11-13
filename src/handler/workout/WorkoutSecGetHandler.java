package handler.workout;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import handler.CommandHandler;
import handler.HandlerException;
import workout.WorkoutDao;
import workout.WorkoutDataBean;

@Controller
public class WorkoutSecGetHandler implements CommandHandler{

	@Resource(name="workoutDao")
	WorkoutDao workoutDao;

	@RequestMapping("/workoutSecGet")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String[] workoutNames = request.getParameterValues("workoutNames[]");
		request.setAttribute("workoutNames", workoutNames);
		List<WorkoutDataBean> workoutsTmp= workoutDao.getAllWorkout();
		
		HashMap<String,WorkoutDataBean> workouts=new HashMap<String,WorkoutDataBean>();
		
		for(int i=0;i<workoutsTmp.size();i++){
			WorkoutDataBean tmp=workoutsTmp.get(i);
			workouts.put(tmp.getWorkout_name(), tmp);
		}
		if(workoutNames!=null){
			System.out.println("[workSecGet] got workNames: "+workoutNames[0]+"외 "+workoutNames.length);
		}
		request.setAttribute("workoutNames",workoutNames);
		request.setAttribute("workouts", workouts);
		
		return new ModelAndView("workout/workoutSecGet");
	}
}
