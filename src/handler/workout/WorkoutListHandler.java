package handler.workout;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import workout.WorkoutDao;
import workout.WorkoutDataBean;

@Controller
public class WorkoutListHandler implements CommandHandler{
	@Resource(name="workoutDao")
	WorkoutDao workoutDao;
	
	@RequestMapping("/workoutList")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		// TODO Auto-generated method stub
		List<WorkoutDataBean> workouts= workoutDao.getAllWorkout();
		request.setAttribute("workouts", workouts);
		return new ModelAndView("workout/workoutList");
	}
	
}
