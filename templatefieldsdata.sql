INSERT INTO document_fields(documentfield,railsvariable) values("file_no",       "episode.file_no");
INSERT INTO document_fields(documentfield,railsvariable) values("assessment_by",		"episode.allocations.last.practitioner.initials");
INSERT INTO document_fields(documentfield,railsvariable) values("client_name",			"episode.client.fullname");
INSERT INTO document_fields(documentfield,railsvariable) values("client_address",	"episode.client.address");
INSERT INTO document_fields(documentfield,railsvariable) values("postcode",				"episode.client.postcode");
INSERT INTO document_fields(documentfield,railsvariable) values("home_phone",			"episode.client.telephone_home");
INSERT INTO document_fields(documentfield,railsvariable) values("mobile_phone",		"episode.client.telephone_mobile");
INSERT INTO document_fields(documentfield,railsvariable) values("referral_date_dd","episode.referral_date.mday");
INSERT INTO document_fields(documentfield,railsvariable) values("referral_date_mm", 	"episode.referral_date.month");
INSERT INTO document_fields(documentfield,railsvariable) values("referral_date_yy", 	"episode.referral_date.year");
INSERT INTO document_fields(documentfield,railsvariable) values("referred_by",	"episode.referred_by");
INSERT INTO document_fields(documentfield,railsvariable) values("email",		"episode.client.email");

