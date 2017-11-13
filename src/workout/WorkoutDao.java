package workout;

import java.util.List;

public interface WorkoutDao {

	public WorkoutDataBean getWorkoutWithName( String workout_name );
	public int insertWorkout( WorkoutDataBean workoutDto );
	public List<WorkoutDataBean> getAllWorkout();
	public List<WorkoutDataBean> getGradeWorkout(String grade);
	public List<WorkoutDataBean> getAutoScheWorkout( WorkoutDataBean workoutDto );
	public List<WorkoutDataBean> getStartWorkout();
	public List<WorkoutDataBean> getEndWorkout();
	public WorkoutDataBean selectWorkout(String workout_name);
	public int updateWorkout(WorkoutDataBean workoutDto);
	public int selectWorkoutsNames(String workout_name);
}
