{% macro test_country_name_exists(model, column_name) %}

  {% set valid_country_names_query %}
    SELECT country_name
    FROM {{ ref('iso_country_codes') }}
  {% endset %}

  {% set results = run_query(valid_country_names_query) %}
  {% if execute %}
    {% set valid_country_names = results.columns[0].values() | map(attribute='value') | list %}

    {% for country_name in valid_country_names %}
      {% set country_name_check_query %}
        SELECT 
          '{{ country_name }}' as country_name,
          COUNT(*) as occurrences
        FROM {{ model }}
        WHERE {{ column_name }} = '{{ country_name }}'
        GROUP BY {{ column_name }}
        HAVING COUNT(*) = 0
      {% endset %}

      {% set country_name_check_results = run_query(country_name_check_query) %}
      {% if country_name_check_results and country_name_check_results.rows | length > 0 %}
        {% do exceptions.raise_compiler_error("Country name '" ~ country_name ~ "' does not exist in column " ~ column_name) %}
      {% endif %}
    {% endfor %}
  {% endif %}
  
{% endmacro %}
