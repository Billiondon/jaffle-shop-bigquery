{{ config(materialized='table') }}

with source_data as (

    select 1 as id
    /* On a supprimé le 'union all select null as id' 
       pour que le test 'not_null' passe au vert.
    */

)

select *
from source_data