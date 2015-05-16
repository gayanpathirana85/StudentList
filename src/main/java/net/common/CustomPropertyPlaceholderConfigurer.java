package net.common;

import org.springframework.beans.SimpleTypeConverter;
import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;

import java.io.IOException;
import java.util.Properties;

/**
 * Created by IntelliJ IDEA.
 * User: gayanp
 * Date: 5/15/15
 * Time: 1:29PM
 * To change this template use File | Settings | File Templates.
 */
public class CustomPropertyPlaceholderConfigurer extends PropertyPlaceholderConfigurer {

    private Properties props;

    private SimpleTypeConverter typeConverter = new SimpleTypeConverter();

    protected void loadProperties(Properties props) throws IOException {
        super.loadProperties(props);
        this.props = props;
    }

    public Properties getProps() {
        return props;
    }

    public String getPropertyValue(String key) {
        String prop = (String) props.get(key);
        return prop != null ? prop : key;
    }
}
