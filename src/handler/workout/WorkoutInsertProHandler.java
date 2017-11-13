package handler.workout;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;

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
public class WorkoutInsertProHandler implements CommandHandler{
	@Resource( name="workoutDao")
	WorkoutDao workoutDao;
	@RequestMapping("/workoutInsertPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		// TODO Auto-generated method stub
		
		try {
			request.setCharacterEncoding( "utf-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String workout_part[] = request.getParameterValues("workout_part");
		String workoutpart="";
		if(workout_part!=null){
            for(int i=0;i<workout_part.length;i++){
               switch(workout_part[i]){
                  case "ALL" : workout_part[i] = "ALL"  ; break;
                  case "HIP" : workout_part[i] = "HIP"; break;
                  case "LEG" : workout_part[i] = "LEG"; break;
                  case "CORE" : workout_part[i] = "ARM"; break;
                  case "BACK" : workout_part[i] = "CHEST"; break;
               }
               workoutpart += workout_part[i];
               if(i!=workout_part.length-1){
            	   workoutpart += ",";
               }
            }
         }
		
		
		WorkoutDataBean workoutDto = new WorkoutDataBean();
		workoutDto.setWorkout_name(request.getParameter("workout_name"));
		workoutDto.setLink(request.getParameter("link"));
		workoutDto.setSec(Integer.parseInt(request.getParameter("sec")));
		workoutDto.setGrade(request.getParameter("grade"));
		workoutDto.setWorkout_part(workoutpart);
		workoutDto.setWorkout_type(request.getParameter("workout_type"));
		workoutDto.setRoutine_step(Integer.parseInt(request.getParameter("routine_step")));
		workoutDto.setFat_grade(Integer.parseInt(request.getParameter("fat_grade")));
		workoutDto.setBmi_grade(Integer.parseInt(request.getParameter("bmi_grade")));
		
		int result=workoutDao.insertWorkout(workoutDto);
		request.setAttribute("result", result);
		return null;
	}

}
