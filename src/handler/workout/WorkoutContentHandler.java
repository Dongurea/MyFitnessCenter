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
import workout.WorkoutDataBean;

@Controller
public class WorkoutContentHandler implements CommandHandler{
	@Resource( name="workoutDao")
	WorkoutDao workoutDao;
	@RequestMapping("/workoutContent")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		// TODO Auto-generated method stub
		String workout_name=request.getParameter("workout_name");
		WorkoutDataBean workoutDto = workoutDao.selectWorkout(workout_name);
		request.setAttribute("workoutDto", workoutDto);
		return new ModelAndView("workout/workoutContent");
	}

}
