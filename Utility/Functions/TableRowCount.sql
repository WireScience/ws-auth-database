create function Utility.TableRowCount
(
  @tableName sysname
)
returns int
as
begin

  declare @rowCount int

  select 
    @rowCount = i.rows
  from 
    dbo.sysindexes				i 
    inner join dbo.sysobjects	o on (o.id = i.id and o.xtype = 'u')
  where 
    i.indid <	2
    and
    i.id	=	object_id(@tableName)

  return isNull(@rowCount, -1)

end