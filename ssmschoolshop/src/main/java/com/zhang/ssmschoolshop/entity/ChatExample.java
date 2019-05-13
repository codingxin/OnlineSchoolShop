package com.zhang.ssmschoolshop.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ChatExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ChatExample() {
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

        public Criteria andChatidIsNull() {
            addCriterion("chatId is null");
            return (Criteria) this;
        }

        public Criteria andChatidIsNotNull() {
            addCriterion("chatId is not null");
            return (Criteria) this;
        }

        public Criteria andChatidEqualTo(Integer value) {
            addCriterion("chatId =", value, "chatid");
            return (Criteria) this;
        }

        public Criteria andChatidNotEqualTo(Integer value) {
            addCriterion("chatId <>", value, "chatid");
            return (Criteria) this;
        }

        public Criteria andChatidGreaterThan(Integer value) {
            addCriterion("chatId >", value, "chatid");
            return (Criteria) this;
        }

        public Criteria andChatidGreaterThanOrEqualTo(Integer value) {
            addCriterion("chatId >=", value, "chatid");
            return (Criteria) this;
        }

        public Criteria andChatidLessThan(Integer value) {
            addCriterion("chatId <", value, "chatid");
            return (Criteria) this;
        }

        public Criteria andChatidLessThanOrEqualTo(Integer value) {
            addCriterion("chatId <=", value, "chatid");
            return (Criteria) this;
        }

        public Criteria andChatidIn(List<Integer> values) {
            addCriterion("chatId in", values, "chatid");
            return (Criteria) this;
        }

        public Criteria andChatidNotIn(List<Integer> values) {
            addCriterion("chatId not in", values, "chatid");
            return (Criteria) this;
        }

        public Criteria andChatidBetween(Integer value1, Integer value2) {
            addCriterion("chatId between", value1, value2, "chatid");
            return (Criteria) this;
        }

        public Criteria andChatidNotBetween(Integer value1, Integer value2) {
            addCriterion("chatId not between", value1, value2, "chatid");
            return (Criteria) this;
        }

        public Criteria andSenduserIsNull() {
            addCriterion("sendUser is null");
            return (Criteria) this;
        }

        public Criteria andSenduserIsNotNull() {
            addCriterion("sendUser is not null");
            return (Criteria) this;
        }

        public Criteria andSenduserEqualTo(Integer value) {
            addCriterion("sendUser =", value, "senduser");
            return (Criteria) this;
        }

        public Criteria andSenduserNotEqualTo(Integer value) {
            addCriterion("sendUser <>", value, "senduser");
            return (Criteria) this;
        }

        public Criteria andSenduserGreaterThan(Integer value) {
            addCriterion("sendUser >", value, "senduser");
            return (Criteria) this;
        }

        public Criteria andSenduserGreaterThanOrEqualTo(Integer value) {
            addCriterion("sendUser >=", value, "senduser");
            return (Criteria) this;
        }

        public Criteria andSenduserLessThan(Integer value) {
            addCriterion("sendUser <", value, "senduser");
            return (Criteria) this;
        }

        public Criteria andSenduserLessThanOrEqualTo(Integer value) {
            addCriterion("sendUser <=", value, "senduser");
            return (Criteria) this;
        }

        public Criteria andSenduserIn(List<Integer> values) {
            addCriterion("sendUser in", values, "senduser");
            return (Criteria) this;
        }

        public Criteria andSenduserNotIn(List<Integer> values) {
            addCriterion("sendUser not in", values, "senduser");
            return (Criteria) this;
        }

        public Criteria andSenduserBetween(Integer value1, Integer value2) {
            addCriterion("sendUser between", value1, value2, "senduser");
            return (Criteria) this;
        }

        public Criteria andSenduserNotBetween(Integer value1, Integer value2) {
            addCriterion("sendUser not between", value1, value2, "senduser");
            return (Criteria) this;
        }

        public Criteria andReceiveuserIsNull() {
            addCriterion("receiveUser is null");
            return (Criteria) this;
        }

        public Criteria andReceiveuserIsNotNull() {
            addCriterion("receiveUser is not null");
            return (Criteria) this;
        }

        public Criteria andReceiveuserEqualTo(Integer value) {
            addCriterion("receiveUser =", value, "receiveuser");
            return (Criteria) this;
        }

        public Criteria andReceiveuserNotEqualTo(Integer value) {
            addCriterion("receiveUser <>", value, "receiveuser");
            return (Criteria) this;
        }

        public Criteria andReceiveuserGreaterThan(Integer value) {
            addCriterion("receiveUser >", value, "receiveuser");
            return (Criteria) this;
        }

        public Criteria andReceiveuserGreaterThanOrEqualTo(Integer value) {
            addCriterion("receiveUser >=", value, "receiveuser");
            return (Criteria) this;
        }

        public Criteria andReceiveuserLessThan(Integer value) {
            addCriterion("receiveUser <", value, "receiveuser");
            return (Criteria) this;
        }

        public Criteria andReceiveuserLessThanOrEqualTo(Integer value) {
            addCriterion("receiveUser <=", value, "receiveuser");
            return (Criteria) this;
        }

        public Criteria andReceiveuserIn(List<Integer> values) {
            addCriterion("receiveUser in", values, "receiveuser");
            return (Criteria) this;
        }

        public Criteria andReceiveuserNotIn(List<Integer> values) {
            addCriterion("receiveUser not in", values, "receiveuser");
            return (Criteria) this;
        }

        public Criteria andReceiveuserBetween(Integer value1, Integer value2) {
            addCriterion("receiveUser between", value1, value2, "receiveuser");
            return (Criteria) this;
        }

        public Criteria andReceiveuserNotBetween(Integer value1, Integer value2) {
            addCriterion("receiveUser not between", value1, value2, "receiveuser");
            return (Criteria) this;
        }

        public Criteria andMsgcontentIsNull() {
            addCriterion("MsgContent is null");
            return (Criteria) this;
        }

        public Criteria andMsgcontentIsNotNull() {
            addCriterion("MsgContent is not null");
            return (Criteria) this;
        }

        public Criteria andMsgcontentEqualTo(String value) {
            addCriterion("MsgContent =", value, "msgcontent");
            return (Criteria) this;
        }

        public Criteria andMsgcontentNotEqualTo(String value) {
            addCriterion("MsgContent <>", value, "msgcontent");
            return (Criteria) this;
        }

        public Criteria andMsgcontentGreaterThan(String value) {
            addCriterion("MsgContent >", value, "msgcontent");
            return (Criteria) this;
        }

        public Criteria andMsgcontentGreaterThanOrEqualTo(String value) {
            addCriterion("MsgContent >=", value, "msgcontent");
            return (Criteria) this;
        }

        public Criteria andMsgcontentLessThan(String value) {
            addCriterion("MsgContent <", value, "msgcontent");
            return (Criteria) this;
        }

        public Criteria andMsgcontentLessThanOrEqualTo(String value) {
            addCriterion("MsgContent <=", value, "msgcontent");
            return (Criteria) this;
        }

        public Criteria andMsgcontentLike(String value) {
            addCriterion("MsgContent like", value, "msgcontent");
            return (Criteria) this;
        }

        public Criteria andMsgcontentNotLike(String value) {
            addCriterion("MsgContent not like", value, "msgcontent");
            return (Criteria) this;
        }

        public Criteria andMsgcontentIn(List<String> values) {
            addCriterion("MsgContent in", values, "msgcontent");
            return (Criteria) this;
        }

        public Criteria andMsgcontentNotIn(List<String> values) {
            addCriterion("MsgContent not in", values, "msgcontent");
            return (Criteria) this;
        }

        public Criteria andMsgcontentBetween(String value1, String value2) {
            addCriterion("MsgContent between", value1, value2, "msgcontent");
            return (Criteria) this;
        }

        public Criteria andMsgcontentNotBetween(String value1, String value2) {
            addCriterion("MsgContent not between", value1, value2, "msgcontent");
            return (Criteria) this;
        }

        public Criteria andMsgtimeIsNull() {
            addCriterion("MsgTime is null");
            return (Criteria) this;
        }

        public Criteria andMsgtimeIsNotNull() {
            addCriterion("MsgTime is not null");
            return (Criteria) this;
        }

        public Criteria andMsgtimeEqualTo(Date value) {
            addCriterion("MsgTime =", value, "msgtime");
            return (Criteria) this;
        }

        public Criteria andMsgtimeNotEqualTo(Date value) {
            addCriterion("MsgTime <>", value, "msgtime");
            return (Criteria) this;
        }

        public Criteria andMsgtimeGreaterThan(Date value) {
            addCriterion("MsgTime >", value, "msgtime");
            return (Criteria) this;
        }

        public Criteria andMsgtimeGreaterThanOrEqualTo(Date value) {
            addCriterion("MsgTime >=", value, "msgtime");
            return (Criteria) this;
        }

        public Criteria andMsgtimeLessThan(Date value) {
            addCriterion("MsgTime <", value, "msgtime");
            return (Criteria) this;
        }

        public Criteria andMsgtimeLessThanOrEqualTo(Date value) {
            addCriterion("MsgTime <=", value, "msgtime");
            return (Criteria) this;
        }

        public Criteria andMsgtimeIn(List<Date> values) {
            addCriterion("MsgTime in", values, "msgtime");
            return (Criteria) this;
        }

        public Criteria andMsgtimeNotIn(List<Date> values) {
            addCriterion("MsgTime not in", values, "msgtime");
            return (Criteria) this;
        }

        public Criteria andMsgtimeBetween(Date value1, Date value2) {
            addCriterion("MsgTime between", value1, value2, "msgtime");
            return (Criteria) this;
        }

        public Criteria andMsgtimeNotBetween(Date value1, Date value2) {
            addCriterion("MsgTime not between", value1, value2, "msgtime");
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