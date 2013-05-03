/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ndc.app.util;

import java.util.Properties;

public class PropertiesUtil {

    private static Properties properties;

    public static Properties getProperties() {
        return properties;
    }

    public static String getProperty(String key) {
        String s = getProperties().getProperty(key);

        if (s != null && !s.isEmpty()) {
            return s.trim();
        } else {
            return s;
        }
    }

    public void setProperties(Properties properties) {
        PropertiesUtil.properties = properties;
    }
}
