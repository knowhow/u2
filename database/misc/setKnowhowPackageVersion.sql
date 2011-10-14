-- This file is part of the knowhow ERP, a free and open source
-- Enterprise Resource Planning software suite,
-- Copyright (c) 2010-2011 by bring.out doo Sarajevo.
-- It is licensed to you under the Common Public Attribution License
-- version 1.0, the full text of which (including knowhow-specific Exhibits)
-- is available in the file LICENSE_CPAL_bring.out_knowhow.md located at the
-- root directory of this source code archive.
-- By using this software, you agree to be bound by its terms.
--

-- usage: set_knowhow_package_version('skeleton');  

CREATE OR REPLACE FUNCTION set_knowhow_package_version(package_name text) RETURNS boolean AS $$

DECLARE 

m_cnt integer;
m_version varchar;

BEGIN

    -- kreiraj tabelu skeleton._versions   
    
    EXECUTE 'create table if not exists u2._versions( name text primary key, version text );';

    SELECT pkghead_version INTO m_version FROM pkghead WHERE pkghead_name = package_name;

    select count(*) INTO m_cnt FROM u2._versions WHERE name = package_name; 
          
    IF m_cnt > 0 THEN
        UPDATE u2._versions SET version = m_version 
            WHERE  name = package_name;
    ELSE   
        INSERT INTO u2._versions(name, version) 
        VALUES (package_name, m_version); 
    END IF; 

    RETURN true;

END;
$$ LANGUAGE plpgsql;

-- knowhow_package_version is the same as package_version(package_name) but it checks u2._versions table

CREATE OR REPLACE FUNCTION knowhow_package_version(package_name text) RETURNS integer AS $$

DECLARE 
pkg_ver text;
v_major integer;
v_minor integer;
v_patch integer;

BEGIN
        
    SELECT version INTO pkg_ver FROM u2._versions WHERE name = package_name;

    if NOT FOUND THEN
        return 0;
    ELSE
        v_major = SUBSTRING(pkg_ver FROM '(\d+).\d+.\d+.*');
        v_minor = SUBSTRING(pkg_ver FROM '\d+.(\d+).\d+.*');
        v_patch = SUBSTRING(pkg_ver FROM '\d+.\d+.(\d+).*');
            
        return v_major * 10000 + v_minor * 100 + v_patch;
    END IF; 

END;
$$ LANGUAGE plpgsql;
