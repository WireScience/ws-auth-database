-- =============================================
-- DeploymentFooter
-- =============================================


print ''
print	'Completed database deployment.'
print 'Database = $(DatabaseName)'
print 'Version  = $(SchemaVersion)'
print	'Server   = ' + cast(ServerProperty('ServerName')		as varchar)
print	'Edition  = ' + cast(ServerProperty('Edition')			as varchar)
