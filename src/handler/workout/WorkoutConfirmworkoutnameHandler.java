package handler.workout;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import workout.WorkoutDao;

@Controller
public class WorkoutConfirmworkoutnameHandler implements CommandHandler{
	@Resource(name="workoutDao")
	WorkoutDao workoutDao;
	@RequestMapping("/workoutConfirmWorkoutname")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		// TODO Auto-generated method stub
		String workout_name=request.getParameter("workout_name");
		int result=workoutDao.selectWorkoutsNames(workout_name);
		request.setAttribute("result",result);
		request.setAttribute("workout_name",workout_name);
		return new ModelAndView("workout/workoutConfirmWorkoutname");
	}

}
