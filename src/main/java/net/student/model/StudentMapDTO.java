package net.student.model;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;
import java.io.Serializable;
import java.util.Hashtable;

/**
 * Created by IntelliJ IDEA.
 * User: gayanp
 * Date: 5/15/15
 * Time: 2:35 PM
 * To change this template use File | Settings | File Templates.
 */
@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
public class StudentMapDTO implements Serializable {

    private Hashtable<String, Student> studentMap = null;

    public Hashtable<String, Student> getStudentMap() {
        return studentMap;
    }

    public void setStudentMap(Hashtable<String, Student> studentMap) {
        this.studentMap = studentMap;
    }
}
