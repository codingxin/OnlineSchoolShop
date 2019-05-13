package com.zhang.ssmschoolshop.entity;

import java.util.ArrayList;
import java.util.List;

public class ActivityExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ActivityExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andActivityidIsNull() {
            addCriterion("activityId is null");
            return (Criteria) this;
        }

        public Criteria andActivityidIsNotNull() {
            addCriterion("activityId is not null");
            return (Criteria) this;
        }

        public Criteria andActivityidEqualTo(Integer value) {
            addCriterion("activityId =", value, "activityid");
            return (Criteria) this;
        }

        public Criteria andActivityidNotEqualTo(Integer value) {
            addCriterion("activityId <>", value, "activityid");
            return (Criteria) this;
        }

        public Criteria andActivityidGreaterThan(Integer value) {
            addCriterion("activityId >", value, "activityid");
            return (Criteria) this;
        }

        public Criteria andActivityidGreaterThanOrEqualTo(Integer value) {
            addCriterion("activityId >=", value, "activityid");
            return (Criteria) this;
        }

        public Criteria andActivityidLessThan(Integer value) {
            addCriterion("activityId <", value, "activityid");
            return (Criteria) this;
        }

        public Criteria andActivityidLessThanOrEqualTo(Integer value) {
            addCriterion("activityId <=", value, "activityid");
            return (Criteria) this;
        }

        public Criteria andActivityidIn(List<Integer> values) {
            addCriterion("activityId in", values, "activityid");
            return (Criteria) this;
        }

        public Criteria andActivityidNotIn(List<Integer> values) {
            addCriterion("activityId not in", values, "activityid");
            return (Criteria) this;
        }

        public Criteria andActivityidBetween(Integer value1, Integer value2) {
            addCriterion("activityId between", value1, value2, "activityid");
            return (Criteria) this;
        }

        public Criteria andActivityidNotBetween(Integer value1, Integer value2) {
            addCriterion("activityId not between", value1, value2, "activityid");
            return (Criteria) this;
        }

        public Criteria andActivitynameIsNull() {
            addCriterion("activityName is null");
            return (Criteria) this;
        }

        public Criteria andActivitynameIsNotNull() {
            addCriterion("activityName is not null");
            return (Criteria) this;
        }

        public Criteria andActivitynameEqualTo(String value) {
            addCriterion("activityName =", value, "activityname");
            return (Criteria) this;
        }

        public Criteria andActivitynameNotEqualTo(String value) {
            addCriterion("activityName <>", value, "activityname");
            return (Criteria) this;
        }

        public Criteria andActivitynameGreaterThan(String value) {
            addCriterion("activityName >", value, "activityname");
            return (Criteria) this;
        }

        public Criteria andActivitynameGreaterThanOrEqualTo(String value) {
            addCriterion("activityName >=", value, "activityname");
            return (Criteria) this;
        }

        public Criteria andActivitynameLessThan(String value) {
            addCriterion("activityName <", value, "activityname");
            return (Criteria) this;
        }

        public Criteria andActivitynameLessThanOrEqualTo(String value) {
            addCriterion("activityName <=", value, "activityname");
            return (Criteria) this;
        }

        public Criteria andActivitynameLike(String value) {
            addCriterion("activityName like", value, "activityname");
            return (Criteria) this;
        }

        public Criteria andActivitynameNotLike(String value) {
            addCriterion("activityName not like", value, "activityname");
            return (Criteria) this;
        }

        public Criteria andActivitynameIn(List<String> values) {
            addCriterion("activityName in", values, "activityname");
            return (Criteria) this;
        }

        public Criteria andActivitynameNotIn(List<String> values) {
            addCriterion("activityName not in", values, "activityname");
            return (Criteria) this;
        }

        public Criteria andActivitynameBetween(String value1, String value2) {
            addCriterion("activityName between", value1, value2, "activityname");
            return (Criteria) this;
        }

        public Criteria andActivitynameNotBetween(String value1, String value2) {
            addCriterion("activityName not between", value1, value2, "activityname");
            return (Criteria) this;
        }

        public Criteria andActivitydesIsNull() {
            addCriterion("activityDes is null");
            return (Criteria) this;
        }

        public Criteria andActivitydesIsNotNull() {
            addCriterion("activityDes is not null");
            return (Criteria) this;
        }

        public Criteria andActivitydesEqualTo(String value) {
            addCriterion("activityDes =", value, "activitydes");
            return (Criteria) this;
        }

        public Criteria andActivitydesNotEqualTo(String value) {
            addCriterion("activityDes <>", value, "activitydes");
            return (Criteria) this;
        }

        public Criteria andActivitydesGreaterThan(String value) {
            addCriterion("activityDes >", value, "activitydes");
            return (Criteria) this;
        }

        public Criteria andActivitydesGreaterThanOrEqualTo(String value) {
            addCriterion("activityDes >=", value, "activitydes");
            return (Criteria) this;
        }

        public Criteria andActivitydesLessThan(String value) {
            addCriterion("activityDes <", value, "activitydes");
            return (Criteria) this;
        }

        public Criteria andActivitydesLessThanOrEqualTo(String value) {
            addCriterion("activityDes <=", value, "activitydes");
            return (Criteria) this;
        }

        public Criteria andActivitydesLike(String value) {
            addCriterion("activityDes like", value, "activitydes");
            return (Criteria) this;
        }

        public Criteria andActivitydesNotLike(String value) {
            addCriterion("activityDes not like", value, "activitydes");
            return (Criteria) this;
        }

        public Criteria andActivitydesIn(List<String> values) {
            addCriterion("activityDes in", values, "activitydes");
            return (Criteria) this;
        }

        public Criteria andActivitydesNotIn(List<String> values) {
            addCriterion("activityDes not in", values, "activitydes");
            return (Criteria) this;
        }

        public Criteria andActivitydesBetween(String value1, String value2) {
            addCriterion("activityDes between", value1, value2, "activitydes");
            return (Criteria) this;
        }

        public Criteria andActivitydesNotBetween(String value1, String value2) {
            addCriterion("activityDes not between", value1, value2, "activitydes");
            return (Criteria) this;
        }

        public Criteria andDiscountIsNull() {
            addCriterion("discount is null");
            return (Criteria) this;
        }

        public Criteria andDiscountIsNotNull() {
            addCriterion("discount is not null");
            return (Criteria) this;
        }

        public Criteria andDiscountEqualTo(Float value) {
            addCriterion("discount =", value, "discount");
            return (Criteria) this;
        }

        public Criteria andDiscountNotEqualTo(Float value) {
            addCriterion("discount <>", value, "discount");
            return (Criteria) this;
        }

        public Criteria andDiscountGreaterThan(Float value) {
            addCriterion("discount >", value, "discount");
            return (Criteria) this;
        }

        public Criteria andDiscountGreaterThanOrEqualTo(Float value) {
            addCriterion("discount >=", value, "discount");
            return (Criteria) this;
        }

        public Criteria andDiscountLessThan(Float value) {
            addCriterion("discount <", value, "discount");
            return (Criteria) this;
        }

        public Criteria andDiscountLessThanOrEqualTo(Float value) {
            addCriterion("discount <=", value, "discount");
            return (Criteria) this;
        }

        public Criteria andDiscountIn(List<Float> values) {
            addCriterion("discount in", values, "discount");
            return (Criteria) this;
        }

        public Criteria andDiscountNotIn(List<Float> values) {
            addCriterion("discount not in", values, "discount");
            return (Criteria) this;
        }

        public Criteria andDiscountBetween(Float value1, Float value2) {
            addCriterion("discount between", value1, value2, "discount");
            return (Criteria) this;
        }

        public Criteria andDiscountNotBetween(Float value1, Float value2) {
            addCriterion("discount not between", value1, value2, "discount");
            return (Criteria) this;
        }

        public Criteria andFullpriceIsNull() {
            addCriterion("fullPrice is null");
            return (Criteria) this;
        }

        public Criteria andFullpriceIsNotNull() {
            addCriterion("fullPrice is not null");
            return (Criteria) this;
        }

        public Criteria andFullpriceEqualTo(Integer value) {
            addCriterion("fullPrice =", value, "fullprice");
            return (Criteria) this;
        }

        public Criteria andFullpriceNotEqualTo(Integer value) {
            addCriterion("fullPrice <>", value, "fullprice");
            return (Criteria) this;
        }

        public Criteria andFullpriceGreaterThan(Integer value) {
            addCriterion("fullPrice >", value, "fullprice");
            return (Criteria) this;
        }

        public Criteria andFullpriceGreaterThanOrEqualTo(Integer value) {
            addCriterion("fullPrice >=", value, "fullprice");
            return (Criteria) this;
        }

        public Criteria andFullpriceLessThan(Integer value) {
            addCriterion("fullPrice <", value, "fullprice");
            return (Criteria) this;
        }

        public Criteria andFullpriceLessThanOrEqualTo(Integer value) {
            addCriterion("fullPrice <=", value, "fullprice");
            return (Criteria) this;
        }

        public Criteria andFullpriceIn(List<Integer> values) {
            addCriterion("fullPrice in", values, "fullprice");
            return (Criteria) this;
        }

        public Criteria andFullpriceNotIn(List<Integer> values) {
            addCriterion("fullPrice not in", values, "fullprice");
            return (Criteria) this;
        }

        public Criteria andFullpriceBetween(Integer value1, Integer value2) {
            addCriterion("fullPrice between", value1, value2, "fullprice");
            return (Criteria) this;
        }

        public Criteria andFullpriceNotBetween(Integer value1, Integer value2) {
            addCriterion("fullPrice not between", value1, value2, "fullprice");
            return (Criteria) this;
        }

        public Criteria andReducepriceIsNull() {
            addCriterion("reducePrice is null");
            return (Criteria) this;
        }

        public Criteria andReducepriceIsNotNull() {
            addCriterion("reducePrice is not null");
            return (Criteria) this;
        }

        public Criteria andReducepriceEqualTo(Integer value) {
            addCriterion("reducePrice =", value, "reduceprice");
            return (Criteria) this;
        }

        public Criteria andReducepriceNotEqualTo(Integer value) {
            addCriterion("reducePrice <>", value, "reduceprice");
            return (Criteria) this;
        }

        public Criteria andReducepriceGreaterThan(Integer value) {
            addCriterion("reducePrice >", value, "reduceprice");
            return (Criteria) this;
        }

        public Criteria andReducepriceGreaterThanOrEqualTo(Integer value) {
            addCriterion("reducePrice >=", value, "reduceprice");
            return (Criteria) this;
        }

        public Criteria andReducepriceLessThan(Integer value) {
            addCriterion("reducePrice <", value, "reduceprice");
            return (Criteria) this;
        }

        public Criteria andReducepriceLessThanOrEqualTo(Integer value) {
            addCriterion("reducePrice <=", value, "reduceprice");
            return (Criteria) this;
        }

        public Criteria andReducepriceIn(List<Integer> values) {
            addCriterion("reducePrice in", values, "reduceprice");
            return (Criteria) this;
        }

        public Criteria andReducepriceNotIn(List<Integer> values) {
            addCriterion("reducePrice not in", values, "reduceprice");
            return (Criteria) this;
        }

        public Criteria andReducepriceBetween(Integer value1, Integer value2) {
            addCriterion("reducePrice between", value1, value2, "reduceprice");
            return (Criteria) this;
        }

        public Criteria andReducepriceNotBetween(Integer value1, Integer value2) {
            addCriterion("reducePrice not between", value1, value2, "reduceprice");
            return (Criteria) this;
        }

        public Criteria andFullnumIsNull() {
            addCriterion("fullNum is null");
            return (Criteria) this;
        }

        public Criteria andFullnumIsNotNull() {
            addCriterion("fullNum is not null");
            return (Criteria) this;
        }

        public Criteria andFullnumEqualTo(Integer value) {
            addCriterion("fullNum =", value, "fullnum");
            return (Criteria) this;
        }

        public Criteria andFullnumNotEqualTo(Integer value) {
            addCriterion("fullNum <>", value, "fullnum");
            return (Criteria) this;
        }

        public Criteria andFullnumGreaterThan(Integer value) {
            addCriterion("fullNum >", value, "fullnum");
            return (Criteria) this;
        }

        public Criteria andFullnumGreaterThanOrEqualTo(Integer value) {
            addCriterion("fullNum >=", value, "fullnum");
            return (Criteria) this;
        }

        public Criteria andFullnumLessThan(Integer value) {
            addCriterion("fullNum <", value, "fullnum");
            return (Criteria) this;
        }

        public Criteria andFullnumLessThanOrEqualTo(Integer value) {
            addCriterion("fullNum <=", value, "fullnum");
            return (Criteria) this;
        }

        public Criteria andFullnumIn(List<Integer> values) {
            addCriterion("fullNum in", values, "fullnum");
            return (Criteria) this;
        }

        public Criteria andFullnumNotIn(List<Integer> values) {
            addCriterion("fullNum not in", values, "fullnum");
            return (Criteria) this;
        }

        public Criteria andFullnumBetween(Integer value1, Integer value2) {
            addCriterion("fullNum between", value1, value2, "fullnum");
            return (Criteria) this;
        }

        public Criteria andFullnumNotBetween(Integer value1, Integer value2) {
            addCriterion("fullNum not between", value1, value2, "fullnum");
            return (Criteria) this;
        }

        public Criteria andReducenumIsNull() {
            addCriterion("reduceNum is null");
            return (Criteria) this;
        }

        public Criteria andReducenumIsNotNull() {
            addCriterion("reduceNum is not null");
            return (Criteria) this;
        }

        public Criteria andReducenumEqualTo(Integer value) {
            addCriterion("reduceNum =", value, "reducenum");
            return (Criteria) this;
        }

        public Criteria andReducenumNotEqualTo(Integer value) {
            addCriterion("reduceNum <>", value, "reducenum");
            return (Criteria) this;
        }

        public Criteria andReducenumGreaterThan(Integer value) {
            addCriterion("reduceNum >", value, "reducenum");
            return (Criteria) this;
        }

        public Criteria andReducenumGreaterThanOrEqualTo(Integer value) {
            addCriterion("reduceNum >=", value, "reducenum");
            return (Criteria) this;
        }

        public Criteria andReducenumLessThan(Integer value) {
            addCriterion("reduceNum <", value, "reducenum");
            return (Criteria) this;
        }

        public Criteria andReducenumLessThanOrEqualTo(Integer value) {
            addCriterion("reduceNum <=", value, "reducenum");
            return (Criteria) this;
        }

        public Criteria andReducenumIn(List<Integer> values) {
            addCriterion("reduceNum in", values, "reducenum");
            return (Criteria) this;
        }

        public Criteria andReducenumNotIn(List<Integer> values) {
            addCriterion("reduceNum not in", values, "reducenum");
            return (Criteria) this;
        }

        public Criteria andReducenumBetween(Integer value1, Integer value2) {
            addCriterion("reduceNum between", value1, value2, "reducenum");
            return (Criteria) this;
        }

        public Criteria andReducenumNotBetween(Integer value1, Integer value2) {
            addCriterion("reduceNum not between", value1, value2, "reducenum");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}