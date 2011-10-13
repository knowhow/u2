--
-- This file is part of the knowhow ERP, a free and open source
-- Enterprise Resource Planning software suite,
-- Copyright (c) 2010-2011 by bring.out doo Sarajevo.
-- It is licensed to you under the Common Public Attribution License
-- version 1.0, the full text of which (including knowhow-specific Exhibits)
-- is available in the file LICENSE_CPAL_bring.out_knowhow.md located at the
-- root directory of this source code archive.
-- By using this software, you agree to be bound by its terms.
--

-- usage:  
-- find check if xtpos package is 3.x.x version                       : select u2.package_is_version('xtpos', '3.[0-9].[0-9]');
-- find check if xtpos package is 3.x and patch number is 1 or 2 or 3 : select u2.package_is_version('xtpos', '3.[0-9].[123]');
-- find check if xtpos package is 3.x and patch number is 1 or 2 or 3,
--  after patch number we could have arbitrary string (rc1, beta2 etc): select u2.package_is_version('xtpos', '3.[0-9].[123].*');


CREATE OR REPLACE FUNCTION package_is_version(package_name text, regexp_version text) RETURNS boolean AS $$

DECLARE cnt integer;

BEGIN
    
    SELECT count(*) INTO cnt FROM pkghead WHERE pkghead_name = package_name AND pkghead_version ~ regexp_version;

    if cnt > 0 THEN
        return true;
    ELSE
        return false;
    END IF;

END;
$$ LANGUAGE plpgsql;
