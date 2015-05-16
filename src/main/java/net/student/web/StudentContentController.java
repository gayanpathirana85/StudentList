package net.student.web;

import net.student.model.Student;
import net.student.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: gayanp
 * Date: 5/15/15
 * Time: 1:22 PM
 * To change this template use File | Settings | File Templates.
 */

@Controller
public class StudentContentController {

    @Autowired
    StudentService studentService;

    /**
     * request Mapping for displayAllStudents
     * @param modelMap
     * @return
     */
    @RequestMapping(value = "/displayAllStudents")
    public String getdisplayAllStudents(ModelMap modelMap) {

        Map<String, Student> studentsMap = studentService.getStudentDataMap();
        modelMap.addAttribute("studentsMap", studentsMap);
        return "/studentsList";
    }

    /**
     * request Mapping for updateStudent ajax call
     * @param modelMap
     * @param request
     * @return
     */
    @RequestMapping(value = "/updateStudent", method = {RequestMethod.POST})
    @ResponseBody
    public String updateStudent(ModelMap modelMap, HttpServletRequest request) {

        Student student;

           student =studentService.getStudentDataMap().get(request.getParameter("number"));

        try{
             student.setBirthDate(new Date(request.getParameter("birthDate")));
        }
        catch (Exception e){}

        student.setStudentNumber(request.getParameter("number"));
        student.setPreferredName(request.getParameter("preferredName"));

        student.setFirstName(request.getParameter("firstName"));
        student.setLastName(request.getParameter("lastName"));
        student.setGender((request.getParameter("gender")));
        student.setDisability((request.getParameter("disability")));
        student.setEmail(request.getParameter("email"));



        studentService.updateStudent(student);

        String status = "done";
        return status;
    }

    /**
     * request Mapping for deleteStudent ajax call
     * @param modelMap
     * @param request
     * @return
     */
    @RequestMapping(value = "/deleteStudent", method = {RequestMethod.POST})
    @ResponseBody
    public String deleteStudent(ModelMap modelMap, HttpServletRequest request) {

        Student student = new Student();

        student.setStudentNumber(request.getParameter("number"));


        studentService.deleteStudent(student);

        String status = "done";
        return status;
    }

    /**
     * request Mapping for  addNewStudent form
     * @param modelMap
     * @return
     */

    @RequestMapping(value = "/addNewStudent")
    public String getaddNewStudent(ModelMap modelMap) {


        return "/addStudentForm";
    }

    /**
     *request Mapping for addStudent
     * @param modelMap
     * @param request
     * @return
     */
    @RequestMapping(value = "/addStudent", method = {RequestMethod.POST})
    @ResponseBody
    public String addStudent(ModelMap modelMap, HttpServletRequest request) {

        Student student = new Student();

        student.setStudentNumber(request.getParameter("number"));
        student.setPreferredName(request.getParameter("preferredName"));
        student.setBirthDate(new Date(request.getParameter("birthDate")));
        student.setFirstName(request.getParameter("firstName"));
        student.setLastName(request.getParameter("lastName"));
        student.setGender(request.getParameter("gender"));
        student.setDisability(request.getParameter("disability"));
        student.setEmail(request.getParameter("email"));


        studentService.updateStudent(student);


        String status = "done";
        return status;
    }
}
