# Bingeflix Docs
This file contains documentation for Bingeflix data sources.

## stg_ads_platform__daily_ads
{% docs stg_ads_platform__daily_ads %}
This table contains daily performance data for ad campaigns managed by the ads platform. Each row represents a unique campaign's performance on a specific date.
{% enddocs %}

{% docs ads_platform_column_date %}
The calendar date for the reporting period of the ad campaign.
{% enddocs %}

{% docs ads_platform_column_campaign_id %}
The unique identifier for the ad campaign. This ID distinguishes each campaign from others.
{% enddocs %}

{% docs ads_platform_column_surrogate_key %}
A surrogate key that uniquely identifies each row in the table by combining the `date` and `campaign_id`.
{% enddocs %}

{% docs ads_platform_column_spend %}
The total amount spent on the ad campaign for the specific date. This value is typically reported in the platform's currency.
{% enddocs %}

{% docs ads_platform_column_cpm %}
The cost per thousand impressions charged by the ads platform. It is a standard metric used in digital advertising.
{% enddocs %}

{% docs ads_platform_column_ctr %}
The click-through rate (CTR) measures the ratio of users who clicked on the ad to the number of total impressions. It is expressed as a percentage.
{% enddocs %}


## stg_bingeflix__events
{% docs stg_bingeflix__events %}
This table contains information about the behavioral events tracked within the Bingeflix platform. Each row represents an event that occurred during a user session.
{% enddocs %}

{% docs bingeflix_column_session_id %}
The unique identifier of the session in the Bingeflix application. A session represents a period of continuous user interaction with the platform.
{% enddocs %}

{% docs bingeflix_column_created_at %}
The timestamp indicating when the event was logged. This reflects the exact time when the event occurred within the session.
{% enddocs %}

{% docs bingeflix_column_user_id %}
The unique identifier of the user who triggered the event. This links the event to a specific Bingeflix user.
{% enddocs %}

{% docs bingeflix_column_event_name %}
The name of the event that was tracked. This indicates the type of action the user performed, such as "login", "video_play", etc.
{% enddocs %}

{% docs bingeflix_column_event_id %}
The unique identifier of the event. This ID ensures that each event is uniquely identifiable within the system.
{% enddocs %}


## stg_bingeflix__subscription_plans

{% docs stg_bingeflix__subscription_plans %}
This table contains information about the various subscription plans available on Bingeflix. Each row represents a different subscription plan that users can select.
{% enddocs %}

{% docs bingeflix_column_subscription_plan_id %}
The unique identifier of the subscription plan. This ID is used to differentiate between different plans.
{% enddocs %}

{% docs bingeflix_column_plan_name %}
The name of the subscription plan. This is the name given to the plan, such as "Basic", "Standard", or "Premium".
{% enddocs %}

{% docs bingeflix_column_pricing %}
The price of the subscription. This represents the cost to the user for subscribing to the plan, typically expressed in dollars.
{% enddocs %}

{% docs bingeflix_column_payment_period %}
The recurring payment period for the subscription. This indicates how often the user is billed for the subscription, such as "monthly" or "yearly".
{% enddocs %}


## stg_bingeflix__subscriptions
{% docs stg_bingeflix__subscriptions %}
This model contains information about Bingeflix subscriptions. Each row represents a subscription that a user has with Bingeflix.
{% enddocs %}

{% docs bingeflix_column_starts_at %}
The date and time when the subscription started. This indicates when the user's access to the plan began.
{% enddocs %}

{% docs bingeflix_column_ends_at %}
The date and time when the subscription ends. If this value is NULL, the subscription is currently active.
{% enddocs %}

{% docs bingeflix_column_subscription_id %}
The unique identifier for the subscription. This ID uniquely identifies each subscription in the system.
{% enddocs %}


## stg_bingeflix__users
{% docs stg_bingeflix__users %}
This table contains information about Bingeflix users. Each row represents a unique user registered on the platform.
{% enddocs %}

{% docs bingeflix_column_phone_number %}
The user's phone number. This is used for account verification and communication purposes.
{% enddocs %}

{% docs bingeflix_column_deleted_at %}
The timestamp indicating when the user's account was deleted. If this value is NULL, the account is still active.
{% enddocs %}

{% docs bingeflix_column_username %}
The username chosen by the user for logging into Bingeflix. This is typically unique to each user.
{% enddocs %}

{% docs bingeflix_column_name %}
The full name of the user, including first and last names.
{% enddocs %}

{% docs bingeflix_column_sex %}
The user's sex at birth, which may be required for certain demographic statistics or personalization features.
{% enddocs %}

{% docs bingeflix_column_email %}
The user's email address. This is used for communication and account-related notifications.
{% enddocs %}

{% docs bingeflix_column_birthdate %}
The user's birthdate, which is used to calculate the user's age and for age-related personalization.
{% enddocs %}

{% docs bingeflix_column_region %}
The state or province where the user resides. This is used for regional content and service distribution.
{% enddocs %}

{% docs bingeflix_column_country %}
The country where the user resides. This information is essential for complying with regional regulations and providing localized services.
{% enddocs %}