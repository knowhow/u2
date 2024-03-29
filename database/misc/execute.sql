--
-- This file is part of the knowhow ERP, a free and open source
-- Enterprise Resource Planning software suite,
-- Copyright (c) 2010-2011 by bring.out doo Sarajevo.
-- It is licensed to you under the Common Public Attribution License
-- version 1.0, the full text of which (including knowhow-specific Exhibits)
-- is available in the file LICENSE_CPAL_bring.out_knowhow.md located at the
-- root directory of this source code archive.
-- By using this software, you agree to be bound by its terms.


-- reference: http://www.depesz.com/index.php/2008/06/18/conditional-ddl/


CREATE OR REPLACE FUNCTION execute(TEXT) RETURNS VOID AS $$

BEGIN EXECUTE $1; END;

$$ LANGUAGE plpgsql STRICT;
