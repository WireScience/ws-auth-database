--
-- dbo.EFMigrationsHistory
--
-- Seed past migration records
--

print	'dbo.__EFMigrationsHistory: populating data...'

declare @efVersion     nvarchar(32)   = '6.0.6'
declare @initialSchema nvarchar(150)  = '00000000000000_CreateIdentitySchema'
declare @schema2       nvarchar(150)  = '20220705021901_Identity_ExtendedProperties'

if not exists(select NULL from dbo.__EFMigrationsHistory where MigrationId = @initialSchema)
  insert dbo.__EFMigrationsHistory (MigrationId, ProductVersion) values (@initialSchema, @efVersion)

if not exists(select NULL from dbo.__EFMigrationsHistory where MigrationId = @schema2)
  insert dbo.__EFMigrationsHistory (MigrationId, ProductVersion) values (@schema2, @efVersion)


print	'dbo.__EFMigrationsHistory: ' + cast(Utility.TableRowCount('dbo.__EFMigrationsHistory') as varchar) + ' row(s).'
