package net.student.service;

import net.common.CustomPropertyPlaceholderConfigurer;
import net.student.model.Student;
import net.student.model.StudentMapDTO;
import org.springframework.beans.factory.annotation.Autowired;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;
import java.io.File;
import java.util.Hashtable;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: gayanp
 * Date: 5/15/15
 * Time: 1:41 PM
 * To change this template use File | Settings | File Templates.
 */
public class StudentServiceImpl implements StudentService {


    private static Hashtable<String, Student> studentMap = new Hashtable<String, Student>();
    @Autowired
    CustomPropertyPlaceholderConfigurer propertyPlaceholderConfigurer;

    private void loadStudentDatafromXML() {

        try {

            File file = new File( propertyPlaceholderConfigurer.getPropertyValue("DATA_File_Location"));
            JAXBContext jaxbContext = JAXBContext.newInstance(StudentMapDTO.class);

            Unmarshaller jaxbUnmarshaller = jaxbContext.createUnmarshaller();
            StudentMapDTO studentMapDTO = (StudentMapDTO) jaxbUnmarshaller.unmarshal(file);

            studentMap = studentMapDTO.getStudentMap();
        } catch (JAXBException e) {
            e.printStackTrace();
        }
    }

    @Override
    public synchronized void updateStudent(Student student) {

        studentMap.put(student.getStudentNumber() + "", student);

        StudentMapDTO studentMapDTO = new StudentMapDTO();
        studentMapDTO.setStudentMap(studentMap);
        updateXML(studentMapDTO);

    }

    private synchronized void updateXML(StudentMapDTO studentMapDTO) {

        try {

            File file = new File(propertyPlaceholderConfigurer.getPropertyValue("DATA_File_Location"));
            JAXBContext jaxbContext = JAXBContext.newInstance(StudentMapDTO.class);
            Marshaller jaxbMarshaller = jaxbContext.createMarshaller();
            jaxbMarshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
            studentMapDTO.setStudentMap(studentMap);
            jaxbMarshaller.marshal(studentMapDTO, file);


        } catch (JAXBException e) {
            e.printStackTrace();
        }

    }

    @Override
    public Map<String, Student> getStudentDataMap() {
        return studentMap;
    }

    @Override
    public void deleteStudent(Student student) {

        studentMap.remove(student.getStudentNumber());
        StudentMapDTO studentMapDTO = new StudentMapDTO();
        studentMapDTO.setStudentMap(studentMap);
        updateXML(studentMapDTO);
    }


}
