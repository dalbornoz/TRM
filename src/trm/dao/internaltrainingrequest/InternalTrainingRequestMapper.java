package trm.dao.internaltrainingrequest;


import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import trm.dao.trainingrequest.TrainingRequest;
import trm.dao.trainingrequest.TrainingRequestCRUD;
import trm.dao.trainingschedule.TrainingSchedule;
import trm.dao.trainingschedule.TrainingScheduleCRUDService;
import trm.dao.employee.Employee;
import trm.dao.employee.EmployeeCRUDService;
import trm.dao.trainingrequest.TrainingRequest;
import trm.dao.trainingrequest.TrainingRequestCRUD;


public class InternalTrainingRequestMapper implements RowMapper<InternalTrainingRequest>
{

	/*CREATE TABLE INTERNAL_TRAINING_REQUEST
	(
	  internal_training_id number(7) primary key,
	  status number(2) not null,
	  confirmed_trainer_id number(7) references internal_trainer(it_trainer_id),
	  training_request_id number(5) references training_request(training_request_id) unique not null,
	  training_spoc_id number(7) references employee(employee_id),
	  internal_training_mode varchar(10),
	  schedule_id varchar(10) references training_schedule(training_schedule_id),
	  description_of_status varchar(30)
	);*/
	
	@Override
	public InternalTrainingRequest mapRow(ResultSet rs, int rowNum) throws SQLException 
	{
		InternalTrainingRequest request = new InternalTrainingRequest();
		
		request.setItrId(rs.getInt(1));
		
		TrainingRequest trainingRequest = new TrainingRequestCRUD().getTrainingRequestById(rs.getInt(2));

		request.setItrTrainingRequest(trainingRequest);
		
		TrainingSchedule schedule = new TrainingScheduleCRUDService().getTrainingScheduleById(rs.getString(3)); 
		request.setItrSchedule(schedule);
		
		Employee trainer = new EmployeeCRUDService().getEmployeeById(rs.getInt(4));
		request.setItrTrainer(trainer);
		
		Employee executive = new EmployeeCRUDService().getEmployeeById(rs.getInt(5));
		request.setItrExecutive(executive);
		
		request.setItrStatus(rs.getInt(6));
		request.setItrStatusDescription(rs.getString(7));
		
		return request;
	}
	
}
