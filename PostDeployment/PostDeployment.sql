/*
Post-Deployment Script Template              
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.    
 Use SQLCMD syntax to include a file in the post-deployment script.      
 Example:      :r .\myfile.sql                
 Use SQLCMD syntax to reference a variable in the post-deployment script.    
 Example:      :setvar TableName MyTable              
               SELECT * FROM [$(TableName)]          
--------------------------------------------------------------------------------------
*/


--
-- Database section

--
-- Schema section
--
--:r .\Database\Database.RightSize.sql


-- Ensure that schema is conformant with guidelines
--:r .\Meta\EnforceSchemaRules.sql

-- Populate Metadata
--:r .\Meta\ContentType.sql
--:r .\Meta\Schema.sql
--:r .\Meta\SchemaComposite.sql
--:r .\Meta\SchemaVersion.sql
--:r .\Meta\SchemaTable.sql

-- Validate schema and metadata
--:r .\Meta\ValidateDatabase.sql


--
-- Data Population section
--

--  Base entities


--  Reference Data
if (upper('$(PopulateReferenceData)') = 'TRUE')
begin
:r  dbo\EFMigrationHistory.sql
end

--  transactional


-- Footer
:r .\DeploymentFooter.sql

/*
End of Post-Deployment script
*/
