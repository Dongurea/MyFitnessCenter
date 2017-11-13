package workout;

import java.util.List;

import db.SqlMapClient;

public class WorkoutDBBean implements WorkoutDao{
	@Override
	public int insertWorkout(WorkoutDataBean workoutDto) {
		return SqlMapClient.getSqlSession().insert( "Workout.insertWorkout", workoutDto );
	}

	@Override
	public List<WorkoutDataBean> getAllWorkout() {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().selectList( "Workout.getAllWorkout");
	}

	@Override
	public List<WorkoutDataBean> getGradeWorkout(String grade) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().selectList( "Workout.getGradeWorkout", grade);
	}

	@Override
	public List<WorkoutDataBean> getAutoScheWorkout(WorkoutDataBean workoutDto) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().selectList( "Workout.getAutoScheWorkout", workoutDto);
	}

	@Override
	public List<WorkoutDataBean> getStartWorkout() {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().selectList( "Workout.getStartWorkout");
	}

	@Override
	public List<WorkoutDataBean> getEndWorkout() {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().selectList( "Workout.getEndWorkout");
	}

	@Override
	public WorkoutDataBean getWorkoutWithName(String workout_name) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().selectOne( "Workout.getWorkoutWithName", workout_name);
	}

	@Override
	public WorkoutDataBean selectWorkout(String workout_name) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().selectOne("Workout.selectWorkout", workout_name);
	}

	@Override
	public int updateWorkout(WorkoutDataBean workoutDto) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().update("Workout.updateWorkout", workoutDto);
	}

	@Override
	public int selectWorkoutsNames(String workout_name) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().selectOne("Workout.selectWorkoutsNames", workout_name);
	}
	
}
