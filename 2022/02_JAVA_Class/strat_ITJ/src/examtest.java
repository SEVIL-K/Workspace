/*
    Created by HG on 2022-04-07
    
*/

import java.util.HashMap;
import java.util.Set;

public class examtest {
    public examtest() {
        HashMap map = new HashMap();

        map.put("이름", "홍길동");
        map.put("나이", "24");
        map.put("성별", "남자");

        Set keys = map.keySet();
        for(Object key : keys) {
            Object value = map.get(key);
            System.out.println(key + " - " + value);
        }
    }
}

