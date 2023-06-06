{% snapshot first_model_snapshot %}
    {{
        config(
          target_database='transform',
          target_schema='snapshot',
          unique_key='id',

          strategy='timestamp',
          updated_at='updated_at',
        )
    }}

    -- Pro-Tip: Use sources in snapshots!
    select * from {{ ref('my_second_dbt_model') }}

{% endsnapshot %}