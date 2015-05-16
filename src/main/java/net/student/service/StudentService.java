package net.student.service;

import net.student.model.Student;

import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: gayanp
 * Date: 5/15/15
 * Time: 3:29 PM
 * To change this template use File | Settings | File Templates.
 */
public interface StudentService {


    public void updateStudent(Student student);

    public Map<String, Student> getStudentDataMap();

    public void deleteStudent(Student student);


}
