/*
 * Copyright (c) 2006 - 2009 Open Source Strategies, Inc.
 *
 * Opentaps is free software: you can redistribute it and/or modify it
 * under the terms of the GNU Affero General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Opentaps is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with Opentaps.  If not, see <http://www.gnu.org/licenses/>.
 */
 
/*
These scripts are for making table changes from opentaps 1.0 to opentaps 1.4
*/

/*
* Modifying the product average cost table to change its primary keys
* The following statements will do:
*   1. drop PRODUCT_AVERAGE_COST old primary key
*   2. add PRODUCT_AVERAGE_COST_ID column
*   3. set different value to PRODUCT_AVERAGE_COST_ID
*   4. set PRODUCT_AVERAGE_COST_ID as primary key
*/
ALTER TABLE PRODUCT_AVERAGE_COST DROP CONSTRAINT PK_PRODUCT_AVERAGE_COST;
ALTER TABLE PRODUCT_AVERAGE_COST ADD COLUMN PRODUCT_AVERAGE_COST_ID character varying(20);
ALTER TABLE PRODUCT_AVERAGE_COST ALTER COLUMN PRODUCT_AVERAGE_COST_ID SET STORAGE EXTENDED;
CREATE TEMP SEQUENCE rownum START 10000;
UPDATE PRODUCT_AVERAGE_COST SET PRODUCT_AVERAGE_COST_ID=nextval('rownum');
DROP SEQUENCE rownum;
ALTER TABLE PRODUCT_AVERAGE_COST ADD CONSTRAINT PK_PRODUCT_AVERAGE_COST PRIMARY KEY (PRODUCT_AVERAGE_COST_ID);
insert into SEQUENCE_VALUE_ITEM(SEQ_NAME, SEQ_ID) select 'ProductAverageCost', CAST (max(PRODUCT_AVERAGE_COST_ID) as numeric)  from PRODUCT_AVERAGE_COST;


update REQUIREMENT set STATUS_ID = 'REQ_CLOSED' where STATUS_ID in ('REQ_ORDERED', 'REQ_PRODUCED', 'REQ_TRANSFERRED');


-- update the columns data type
ALTER TABLE ADDRESS_MATCH_MAP ALTER COLUMN SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE AGREEMENT_INVOICE_ITEM_TYPE ALTER COLUMN SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE AGREEMENT_ITEM_TO_TERM_MAP ALTER COLUMN SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE AGREEMENT_ITEM_TO_TERM_MAP ALTER COLUMN MAX_ALLOWED TYPE NUMERIC(20,0);
ALTER TABLE AGREEMENT_PROMO_APPL ALTER COLUMN SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE AGREEMENT_TERM ALTER COLUMN TERM_DAYS TYPE NUMERIC(20,0);
ALTER TABLE AGREEMENT_TO_ITEM_MAP ALTER COLUMN SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE AGREEMENT_TO_ITEM_MAP ALTER COLUMN MAX_ALLOWED TYPE NUMERIC(20,0);
ALTER TABLE BILLING_ACCOUNT_TERM ALTER COLUMN TERM_DAYS TYPE NUMERIC(20,0);
ALTER TABLE CARRIER_SHIPMENT_METHOD ALTER COLUMN SEQUENCE_NUMBER TYPE NUMERIC(20,0);
ALTER TABLE CATALINA_SESSION ALTER COLUMN SESSION_SIZE TYPE NUMERIC(20,0);
ALTER TABLE CATALINA_SESSION ALTER COLUMN MAX_IDLE TYPE NUMERIC(20,0);
ALTER TABLE CATALINA_SESSION ALTER COLUMN LAST_ACCESSED TYPE NUMERIC(20,0);
ALTER TABLE COMM_EVENT_CONTENT_ASSOC ALTER COLUMN SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE CONTENT ALTER COLUMN CHILD_LEAF_COUNT TYPE NUMERIC(20,0);
ALTER TABLE CONTENT ALTER COLUMN CHILD_BRANCH_COUNT TYPE NUMERIC(20,0);
ALTER TABLE CONTENT_APPROVAL ALTER COLUMN SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE CONTENT_ASSOC ALTER COLUMN SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE CONTENT_ASSOC ALTER COLUMN UPPER_COORDINATE TYPE NUMERIC(20,0);
ALTER TABLE CONTENT_ASSOC ALTER COLUMN LEFT_COORDINATE TYPE NUMERIC(20,0);
ALTER TABLE COST_COMPONENT_CALC ALTER COLUMN PER_MILLI_SECOND TYPE NUMERIC(20,0);
ALTER TABLE CREDIT_CARD ALTER COLUMN CONSECUTIVE_FAILED_AUTHS TYPE NUMERIC(20,0);
ALTER TABLE CREDIT_CARD ALTER COLUMN CONSECUTIVE_FAILED_NSF TYPE NUMERIC(20,0);
ALTER TABLE CUST_REQUEST ALTER COLUMN PRIORITY TYPE NUMERIC(20,0);
ALTER TABLE CUST_REQUEST_ITEM ALTER COLUMN PRIORITY TYPE NUMERIC(20,0);
ALTER TABLE CUST_REQUEST_ITEM ALTER COLUMN SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE CUSTOM_TIME_PERIOD ALTER COLUMN PERIOD_NUM TYPE NUMERIC(20,0);
ALTER TABLE DATA_IMPORT_CUSTOMER ALTER COLUMN NET_PAYMENT_DAYS TYPE NUMERIC(20,0);
ALTER TABLE DATA_IMPORT_SUPPLIER ALTER COLUMN NET_PAYMENT_DAYS TYPE NUMERIC(20,0);
ALTER TABLE EFT_ACCOUNT ALTER COLUMN YEARS_AT_BANK TYPE NUMERIC(20,0);
ALTER TABLE ENTITY_SYNC ALTER COLUMN OFFLINE_SYNC_SPLIT_MILLIS TYPE NUMERIC(20,0);
ALTER TABLE ENTITY_SYNC ALTER COLUMN SYNC_SPLIT_MILLIS TYPE NUMERIC(20,0);
ALTER TABLE ENTITY_SYNC ALTER COLUMN SYNC_END_BUFFER_MILLIS TYPE NUMERIC(20,0);
ALTER TABLE ENTITY_SYNC ALTER COLUMN MAX_RUNNING_NO_UPDATE_MILLIS TYPE NUMERIC(20,0);
ALTER TABLE ENTITY_SYNC_HISTORY ALTER COLUMN LAST_SPLIT_START_TIME TYPE NUMERIC(20,0);
ALTER TABLE ENTITY_SYNC_HISTORY ALTER COLUMN TO_CREATE_INSERTED TYPE NUMERIC(20,0);
ALTER TABLE ENTITY_SYNC_HISTORY ALTER COLUMN TO_CREATE_UPDATED TYPE NUMERIC(20,0);
ALTER TABLE ENTITY_SYNC_HISTORY ALTER COLUMN TO_CREATE_NOT_UPDATED TYPE NUMERIC(20,0);
ALTER TABLE ENTITY_SYNC_HISTORY ALTER COLUMN TO_STORE_INSERTED TYPE NUMERIC(20,0);
ALTER TABLE ENTITY_SYNC_HISTORY ALTER COLUMN TO_STORE_UPDATED TYPE NUMERIC(20,0);
ALTER TABLE ENTITY_SYNC_HISTORY ALTER COLUMN TO_STORE_NOT_UPDATED TYPE NUMERIC(20,0);
ALTER TABLE ENTITY_SYNC_HISTORY ALTER COLUMN TO_REMOVE_DELETED TYPE NUMERIC(20,0);
ALTER TABLE ENTITY_SYNC_HISTORY ALTER COLUMN TO_REMOVE_ALREADY_DELETED TYPE NUMERIC(20,0);
ALTER TABLE ENTITY_SYNC_HISTORY ALTER COLUMN TOTAL_ROWS_EXPORTED TYPE NUMERIC(20,0);
ALTER TABLE ENTITY_SYNC_HISTORY ALTER COLUMN TOTAL_ROWS_TO_CREATE TYPE NUMERIC(20,0);
ALTER TABLE ENTITY_SYNC_HISTORY ALTER COLUMN TOTAL_ROWS_TO_STORE TYPE NUMERIC(20,0);
ALTER TABLE ENTITY_SYNC_HISTORY ALTER COLUMN TOTAL_ROWS_TO_REMOVE TYPE NUMERIC(20,0);
ALTER TABLE ENTITY_SYNC_HISTORY ALTER COLUMN TOTAL_SPLITS TYPE NUMERIC(20,0);
ALTER TABLE ENTITY_SYNC_HISTORY ALTER COLUMN TOTAL_STORE_CALLS TYPE NUMERIC(20,0);
ALTER TABLE ENTITY_SYNC_HISTORY ALTER COLUMN RUNNING_TIME_MILLIS TYPE NUMERIC(20,0);
ALTER TABLE ENTITY_SYNC_HISTORY ALTER COLUMN PER_SPLIT_MIN_MILLIS TYPE NUMERIC(20,0);
ALTER TABLE ENTITY_SYNC_HISTORY ALTER COLUMN PER_SPLIT_MAX_MILLIS TYPE NUMERIC(20,0);
ALTER TABLE ENTITY_SYNC_HISTORY ALTER COLUMN PER_SPLIT_MIN_ITEMS TYPE NUMERIC(20,0);
ALTER TABLE ENTITY_SYNC_HISTORY ALTER COLUMN PER_SPLIT_MAX_ITEMS TYPE NUMERIC(20,0);
ALTER TABLE FACILITY ALTER COLUMN SQUARE_FOOTAGE TYPE NUMERIC(20,0);
ALTER TABLE FACILITY ALTER COLUMN DEFAULT_DAYS_TO_SHIP TYPE NUMERIC(20,0);
ALTER TABLE FACILITY_ASSOC ALTER COLUMN SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE FACILITY_GROUP_MEMBER ALTER COLUMN SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE FACILITY_GROUP_ROLLUP ALTER COLUMN SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE FACILITY_TEAM_ROLE_SECURITY ALTER COLUMN SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE FIXED_ASSET_PRODUCT ALTER COLUMN SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE INVENTORY_ITEM_TRACE_DETAIL ALTER COLUMN TRACE_LEVEL TYPE NUMERIC(20,0);
ALTER TABLE INVOICE_ITEM_TYPE ALTER COLUMN DEFAULT_SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE INVOICE_TERM ALTER COLUMN TERM_DAYS TYPE NUMERIC(20,0);
ALTER TABLE JOB_SANDBOX ALTER COLUMN MAX_RETRY TYPE NUMERIC(20,0);
ALTER TABLE LOCKBOX_BATCH ALTER COLUMN BATCH_COUNT TYPE NUMERIC(20,0);
ALTER TABLE MRP_PRODUCT_STORE_GROUP_MEMBER ALTER COLUMN SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE NET_SUITE_CUSTOMER ALTER COLUMN CUSTOMER_ID TYPE NUMERIC(20,0);
ALTER TABLE NET_SUITE_CUSTOMER ALTER COLUMN REMINDERDAYS TYPE NUMERIC(20,0);
ALTER TABLE NET_SUITE_ITEM ALTER COLUMN ITEM_ID TYPE NUMERIC(20,0);
ALTER TABLE NET_SUITE_ITEM_PRICE ALTER COLUMN PRICE_ID TYPE NUMERIC(20,0);
ALTER TABLE NET_SUITE_ITEM_PRICE ALTER COLUMN DISCOUNT_PERCENTAGE TYPE NUMERIC(20,0);
ALTER TABLE NET_SUITE_ITEM_PRICE ALTER COLUMN ITEM_ID TYPE NUMERIC(20,0);
ALTER TABLE NET_SUITE_ITEM_PRICE ALTER COLUMN ITEM_PRICE_ID TYPE NUMERIC(20,0);
ALTER TABLE NET_SUITE_ITEM_PRICE ALTER COLUMN ITEM_QUANTITY_ID TYPE NUMERIC(20,0);
ALTER TABLE NET_SUITE_PAYMENT_TERM ALTER COLUMN DAYS_UNTIL_DUE TYPE NUMERIC(20,0);
ALTER TABLE NET_SUITE_PAYMENT_TERM ALTER COLUMN DISCOUNT_DAYS TYPE NUMERIC(20,0);
ALTER TABLE NET_SUITE_PAYMENT_TERM ALTER COLUMN MINIMUM_DAYS TYPE NUMERIC(20,0);
ALTER TABLE NET_SUITE_PRICE_LIST ALTER COLUMN DISCOUNT_PERCENTAGE TYPE NUMERIC(20,0);
ALTER TABLE NET_SUITE_PRICE_LIST ALTER COLUMN PRICE_TYPE_ID TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT_KEYWORD_RESULT ALTER COLUMN NUM_RESULTS TYPE NUMERIC(20,0);
ALTER TABLE ORDER_DELIVERY_SCHEDULE ALTER COLUMN CARTONS TYPE NUMERIC(20,0);
ALTER TABLE ORDER_DELIVERY_SCHEDULE ALTER COLUMN SKIDS_PALLETS TYPE NUMERIC(20,0);
ALTER TABLE ORDER_ITEM_SHIP_GRP_INV_RES ALTER COLUMN SEQUENCE_ID TYPE NUMERIC(20,0);
ALTER TABLE ORDER_PAYMENT_PREFERENCE ALTER COLUMN PROCESS_ATTEMPT TYPE NUMERIC(20,0);
ALTER TABLE ORDER_TERM ALTER COLUMN TERM_DAYS TYPE NUMERIC(20,0);
ALTER TABLE PAGINATION_PREFERENCE ALTER COLUMN VIEW_SIZE TYPE NUMERIC(20,0);
ALTER TABLE PAGINATION_PREFERENCE ALTER COLUMN CURSOR_INDEX TYPE NUMERIC(20,0);
ALTER TABLE PARTY_ACCTG_PREFERENCE ALTER COLUMN FISCAL_YEAR_START_MONTH TYPE NUMERIC(20,0);
ALTER TABLE PARTY_ACCTG_PREFERENCE ALTER COLUMN FISCAL_YEAR_START_DAY TYPE NUMERIC(20,0);
ALTER TABLE PARTY_ACCTG_PREFERENCE ALTER COLUMN LAST_INVOICE_NUMBER TYPE NUMERIC(20,0);
ALTER TABLE PARTY_ACCTG_PREFERENCE ALTER COLUMN LAST_QUOTE_NUMBER TYPE NUMERIC(20,0);
ALTER TABLE PARTY_ACCTG_PREFERENCE ALTER COLUMN LAST_ORDER_NUMBER TYPE NUMERIC(20,0);
ALTER TABLE PARTY_BENEFIT ALTER COLUMN AVAILABLE_TIME TYPE NUMERIC(20,0);
ALTER TABLE PARTY_CONTACT_MECH ALTER COLUMN YEARS_WITH_CONTACT_MECH TYPE NUMERIC(20,0);
ALTER TABLE PARTY_CONTACT_MECH ALTER COLUMN MONTHS_WITH_CONTACT_MECH TYPE NUMERIC(20,0);
ALTER TABLE PARTY_SKILL ALTER COLUMN YEARS_EXPERIENCE TYPE NUMERIC(20,0);
ALTER TABLE PARTY_SKILL ALTER COLUMN RATING TYPE NUMERIC(20,0);
ALTER TABLE PARTY_SKILL ALTER COLUMN SKILL_LEVEL TYPE NUMERIC(20,0);
ALTER TABLE PARTY_SUPPLEMENTAL_DATA ALTER COLUMN NUMBER_EMPLOYEES TYPE NUMERIC(20,0);
ALTER TABLE PERIOD_TYPE ALTER COLUMN PERIOD_LENGTH TYPE NUMERIC(20,0);
ALTER TABLE PERSON ALTER COLUMN YEARS_WITH_EMPLOYER TYPE NUMERIC(20,0);
ALTER TABLE PERSON ALTER COLUMN MONTHS_WITH_EMPLOYER TYPE NUMERIC(20,0);
ALTER TABLE PICKLIST_BIN ALTER COLUMN BIN_LOCATION_NUMBER TYPE NUMERIC(20,0);
ALTER TABLE POS_TERMINAL_LOG ALTER COLUMN ITEM_COUNT TYPE NUMERIC(20,0);
ALTER TABLE PROD_CATALOG_CATEGORY ALTER COLUMN SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE PROD_CATALOG_INV_FACILITY ALTER COLUMN SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE PROD_CATALOG_ROLE ALTER COLUMN SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT ALTER COLUMN PIECES_INCLUDED TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT ALTER COLUMN BILL_OF_MATERIAL_LEVEL TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT_ASSOC ALTER COLUMN SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT_CALCULATED_INFO ALTER COLUMN TOTAL_TIMES_VIEWED TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT_CATEGORY_CONTENT ALTER COLUMN USE_COUNT_LIMIT TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT_CATEGORY_LINK ALTER COLUMN SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT_CATEGORY_MEMBER ALTER COLUMN SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT_CATEGORY_ROLLUP ALTER COLUMN SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT_CONFIG ALTER COLUMN SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT_CONFIG_CONFIG ALTER COLUMN SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT_CONFIG_OPTION ALTER COLUMN SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT_CONFIG_OPTION_IACTN ALTER COLUMN SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT_CONFIG_PRODUCT ALTER COLUMN SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT_CONFIG_STATS ALTER COLUMN NUM_OF_CONFS TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT_CONTENT ALTER COLUMN USE_COUNT_LIMIT TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT_CONTENT ALTER COLUMN USE_TIME TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT_FACILITY ALTER COLUMN DAYS_TO_SHIP TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT_FEATURE ALTER COLUMN DEFAULT_SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT_FEATURE_APPL ALTER COLUMN SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT_FEATURE_GROUP_APPL ALTER COLUMN SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT_KEYWORD ALTER COLUMN RELEVANCY_WEIGHT TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT_MAINT ALTER COLUMN REPEAT_COUNT TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT_PAYMENT_METHOD_TYPE ALTER COLUMN SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT_PROMO ALTER COLUMN USE_LIMIT_PER_ORDER TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT_PROMO ALTER COLUMN USE_LIMIT_PER_CUSTOMER TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT_PROMO ALTER COLUMN USE_LIMIT_PER_PROMOTION TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT_PROMO_CODE ALTER COLUMN USE_LIMIT_PER_CODE TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT_PROMO_CODE ALTER COLUMN USE_LIMIT_PER_CUSTOMER TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT_SEARCH_RESULT ALTER COLUMN NUM_RESULTS TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT_STORE ALTER COLUMN DAYS_TO_CANCEL_NON_PAY TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT_STORE ALTER COLUMN AUTO_ORDER_CC_TRY_LATER_MAX TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT_STORE ALTER COLUMN STORE_CREDIT_VALID_DAYS TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT_STORE_CATALOG ALTER COLUMN SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT_STORE_FACILITY ALTER COLUMN SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT_STORE_FIN_ACT_SETTING ALTER COLUMN ACCOUNT_CODE_LENGTH TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT_STORE_FIN_ACT_SETTING ALTER COLUMN PIN_CODE_LENGTH TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT_STORE_FIN_ACT_SETTING ALTER COLUMN ACCOUNT_VALID_DAYS TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT_STORE_FIN_ACT_SETTING ALTER COLUMN AUTH_VALID_DAYS TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT_STORE_GROUP_MEMBER ALTER COLUMN SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT_STORE_GROUP_ROLLUP ALTER COLUMN SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT_STORE_PROMO_APPL ALTER COLUMN SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT_STORE_ROLE ALTER COLUMN SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT_STORE_SHIPMENT_METH ALTER COLUMN SEQUENCE_NUMBER TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT_STORE_SURVEY_APPL ALTER COLUMN SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT_SUBSCRIPTION_RESOURCE ALTER COLUMN MAX_LIFE_TIME TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT_SUBSCRIPTION_RESOURCE ALTER COLUMN AVAILABLE_TIME TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT_SUBSCRIPTION_RESOURCE ALTER COLUMN USE_COUNT_LIMIT TYPE NUMERIC(20,0);
ALTER TABLE PRODUCT_SUBSCRIPTION_RESOURCE ALTER COLUMN USE_TIME TYPE NUMERIC(20,0);
ALTER TABLE QUOTE_TERM ALTER COLUMN TERM_VALUE TYPE NUMERIC(20,0);
ALTER TABLE RECURRENCE_INFO ALTER COLUMN RECURRENCE_COUNT TYPE NUMERIC(20,0);
ALTER TABLE RECURRENCE_RULE ALTER COLUMN COUNT_NUMBER TYPE NUMERIC(20,0);
ALTER TABLE RECURRENCE_RULE ALTER COLUMN INTERVAL_NUMBER TYPE NUMERIC(20,0);
ALTER TABLE SALES_OPPORTUNITY_STAGE ALTER COLUMN SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE SALES_TEAM_ROLE_SECURITY ALTER COLUMN SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE SEQUENCE_VALUE_ITEM ALTER COLUMN SEQ_ID TYPE NUMERIC(20,0);
ALTER TABLE SERVER_HIT ALTER COLUMN NUM_OF_BYTES TYPE NUMERIC(20,0);
ALTER TABLE SERVER_HIT ALTER COLUMN RUNNING_TIME_MILLIS TYPE NUMERIC(20,0);
ALTER TABLE SERVER_HIT_BIN ALTER COLUMN NUMBER_HITS TYPE NUMERIC(20,0);
ALTER TABLE SERVER_HIT_BIN ALTER COLUMN TOTAL_TIME_MILLIS TYPE NUMERIC(20,0);
ALTER TABLE SERVER_HIT_BIN ALTER COLUMN MIN_TIME_MILLIS TYPE NUMERIC(20,0);
ALTER TABLE SERVER_HIT_BIN ALTER COLUMN MAX_TIME_MILLIS TYPE NUMERIC(20,0);
ALTER TABLE SETTLEMENT_TERM ALTER COLUMN TERM_VALUE TYPE NUMERIC(20,0);
ALTER TABLE SHIPMENT_METHOD_TYPE ALTER COLUMN SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE SURVEY_MULTI_RESP_COLUMN ALTER COLUMN SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE SURVEY_PAGE ALTER COLUMN SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE SURVEY_QUESTION_APPL ALTER COLUMN SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE SURVEY_QUESTION_OPTION ALTER COLUMN SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE SURVEY_QUESTION_OPTION ALTER COLUMN DURATION TYPE NUMERIC(20,0);
ALTER TABLE SURVEY_RESPONSE_ANSWER ALTER COLUMN NUMERIC_RESPONSE TYPE NUMERIC(20,0);
ALTER TABLE SURVEY_RESPONSE_ANSWER ALTER COLUMN DURATION TYPE NUMERIC(20,0);
ALTER TABLE SURVEY_RESPONSE_ANSWER ALTER COLUMN SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE TEST_ENTITY ALTER COLUMN TEST_NUMERIC_FIELD TYPE NUMERIC(20,0);
ALTER TABLE TESTING ALTER COLUMN TESTING_SIZE TYPE NUMERIC(20,0);
ALTER TABLE TRACKING_CODE ALTER COLUMN TRACKABLE_LIFETIME TYPE NUMERIC(20,0);
ALTER TABLE TRACKING_CODE ALTER COLUMN BILLABLE_LIFETIME TYPE NUMERIC(20,0);
ALTER TABLE UOM_CONVERSION ALTER COLUMN DECIMAL_SCALE TYPE NUMERIC(20,0);
ALTER TABLE UOM_CONVERSION_DATED ALTER COLUMN DECIMAL_SCALE TYPE NUMERIC(20,0);
ALTER TABLE USER_LOGIN ALTER COLUMN SUCCESSIVE_FAILED_LOGINS TYPE NUMERIC(20,0);
ALTER TABLE USPS_ZIP_TO_BMC_CODE ALTER COLUMN POSTAL_ZONE TYPE NUMERIC(20,0);
ALTER TABLE VALUE_LINK_KEY ALTER COLUMN WORKING_KEY_INDEX TYPE NUMERIC(20,0);
ALTER TABLE WAREHOUSE_SUMMARY_DATA ALTER COLUMN REQUIRED_STOCK_MOVES TYPE NUMERIC(20,0);
ALTER TABLE WAREHOUSE_SUMMARY_DATA ALTER COLUMN REQUESTED_INVENTORY_TRANSFERS TYPE NUMERIC(20,0);
ALTER TABLE WAREHOUSE_SUMMARY_DATA ALTER COLUMN NUMBER_BACK_ORDERS TYPE NUMERIC(20,0);
ALTER TABLE WAREHOUSE_SUMMARY_DATA ALTER COLUMN NUMBER_PRODUCTS_BACK_ORDERED TYPE NUMERIC(20,0);
ALTER TABLE WAREHOUSE_SUMMARY_DATA ALTER COLUMN ORDERS_READY_SHIP TYPE NUMERIC(20,0);
ALTER TABLE WAREHOUSE_SUMMARY_DATA ALTER COLUMN OPEN_PICKLISTS TYPE NUMERIC(20,0);
ALTER TABLE WAREHOUSE_SUMMARY_DATA ALTER COLUMN PICKLISTS_SHIPPED TYPE NUMERIC(20,0);
ALTER TABLE WAREHOUSE_SUMMARY_DATA ALTER COLUMN NEW_PRODUCT_RUNS TYPE NUMERIC(20,0);
ALTER TABLE WAREHOUSE_SUMMARY_DATA ALTER COLUMN SCHEDULED_PRODUCTION_RUNS TYPE NUMERIC(20,0);
ALTER TABLE WAREHOUSE_SUMMARY_DATA ALTER COLUMN CONFIRMED_PRODUCTION_RUNS TYPE NUMERIC(20,0);
ALTER TABLE WAREHOUSE_SUMMARY_DATA ALTER COLUMN ACTIVE_PRODUCTION_RUNS TYPE NUMERIC(20,0);
ALTER TABLE WAREHOUSE_SUMMARY_PICK_MOVE ALTER COLUMN ORDER_READY_TO_PICK_INFO TYPE NUMERIC(20,0);
ALTER TABLE WEB_SITE_ROLE ALTER COLUMN SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE WORK_EFFORT ALTER COLUMN PRIORITY TYPE NUMERIC(20,0);
ALTER TABLE WORK_EFFORT ALTER COLUMN PERCENT_COMPLETE TYPE NUMERIC(20,0);
ALTER TABLE WORK_EFFORT ALTER COLUMN TIME_TRANSPARENCY TYPE NUMERIC(20,0);
ALTER TABLE WORK_EFFORT ALTER COLUMN REVISION_NUMBER TYPE NUMERIC(20,0);
ALTER TABLE WORK_EFFORT_ASSOC ALTER COLUMN SEQUENCE_NUM TYPE NUMERIC(20,0);
ALTER TABLE WORK_EFFORT_KEYWORD ALTER COLUMN RELEVANCY_WEIGHT TYPE NUMERIC(20,0);
ALTER TABLE WORK_EFFORT_SEARCH_RESULT ALTER COLUMN NUM_RESULTS TYPE NUMERIC(20,0);
ALTER TABLE ENCUMBRANCE_DETAIL ALTER COLUMN ORIGINAL_QUANTITY TYPE NUMERIC(18,6);
ALTER TABLE ENCUMBRANCE_DETAIL ALTER COLUMN CANCEL_QUANTITY TYPE NUMERIC(18,6);
ALTER TABLE ENCUMBRANCE_DETAIL ALTER COLUMN INVOICED_QUANTITY TYPE NUMERIC(18,6);
ALTER TABLE ENCUMBRANCE_DETAIL ALTER COLUMN ENCUMBERED_QUANTITY TYPE NUMERIC(18,6);
ALTER TABLE ENCUMBRANCE_DETAIL ALTER COLUMN UNIT_AMOUNT TYPE NUMERIC(18,2);
ALTER TABLE ENCUMBRANCE_DETAIL ALTER COLUMN ENCUMBERED_AMOUNT TYPE NUMERIC(18,2);
ALTER TABLE ENCUMBRANCE_DETAIL ALTER COLUMN GL_ACCOUNT_ID TYPE VARCHAR(20);
ALTER TABLE DATA_IMPORT_PRODUCT ALTER COLUMN DESCRIPTION TYPE TEXT;
ALTER TABLE ORDER_ITEM_PRICE_INFO ALTER COLUMN MODIFY_AMOUNT TYPE NUMERIC(18,3);
ALTER TABLE PAGINATION_PREFERENCE ALTER COLUMN USER_LOGIN_ID TYPE VARCHAR(250);
ALTER TABLE WORK_EFFORT_VIEW_HISTORY ALTER COLUMN USER_LOGIN_ID TYPE VARCHAR(250);
