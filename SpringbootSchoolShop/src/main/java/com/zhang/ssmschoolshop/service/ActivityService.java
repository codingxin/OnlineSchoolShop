package com.zhang.ssmschoolshop.service;


import com.zhang.ssmschoolshop.entity.Activity;
import com.zhang.ssmschoolshop.entity.ActivityExample;

import java.util.List;

public interface ActivityService {
    List<Activity> getAllActivity(ActivityExample activityExample);

    void insertActivitySelective(Activity activity);

    Activity selectByKey(Integer activityid);

    void deleteByActivityId(Integer activityid);

//    void updateGoodsActSelective(Goods goods);
}
