--This query returns MUCH more than you see in the final PaperCut version. Drop out unwanted columns.

--Set the number of days to include in the report

declare @days_to_report int
set @days_to_report = 365

select 
	printerusa0_.usage_date as usage2_14_0_, 
	printerusa0_.usage_day as usage3_14_0_, 
	printerusa0_.used_by_user_id as used4_14_0_, 
	printerusa0_.charged_to_account_id as charged5_14_0_, 
	printerusa0_.usage_cost as usage6_14_0_, 
	printerusa0_.usage_allowed as usage7_14_0_, 
	printerusa0_.printer_id as printer8_14_0_, 
	printerusa0_.job_id as job10_14_0_, 
	printerusa0_.document_name as document11_14_0_, 
	printerusa0_.client_machine as client12_14_0_, 
	printerusa0_.total_pages as total13_14_0_, 
	printerusa0_.total_sheets as total14_14_0_, 
	printerusa0_.copies as copies14_0_, 
	printerusa0_.paper_size as paper16_14_0_, 
	printerusa0_.paper_height_mm as paper17_14_0_, 
	printerusa0_.paper_width_mm as paper18_14_0_, 
	printerusa0_.printer_language as printer19_14_0_, 
	printerusa0_.document_size_kb as document20_14_0_, 
	printerusa0_.denied_reason as denied21_14_0_, 
	printerusa0_.duplex as duplex14_0_, 
	printerusa0_.gray_scale as gray23_14_0_, 
	printerusa0_.printed as printed14_0_, 
	printerusa0_.cancelled as cancelled14_0_, 
	printerusa0_.refunded as refunded14_0_, 
	printerusa0_.assoc_with_account_id as assoc27_14_0_, 
	printerusa0_.total_color_pages as total28_14_0_, 
	printerusa0_.color_pages_estimated as color29_14_0_, 
	printerusa0_.job_type as job30_14_0_, 
	printerusa0_.invoiced as invoiced14_0_, 
	printerusa0_.job_comment as job32_14_0_, 
	printerusa0_.protocol as protocol14_0_, 
	printerusa0_.original_usage_cost as original34_14_0_, 
	printerusa0_.refund_status as refund35_14_0_, 
	printerusa0_.refund_request_id as refund36_14_0_, 
	printerusa0_.replayed as replayed14_0_, 
	printerusa0_.signature as signature14_0_,
	printerusa0_.hardware_check_status as hardware39_14_0_, 
	printerusa0_.hardware_check_id as hardware40_14_0_, 
	printerusa0_.job_uid as job41_14_0_, 
	printerusa0_.archive_path as archive42_14_0_, 
	printerusa0_.duplex_pages as duplex43_14_0_, 
	printer1_.server_name as server2_10_1_, 
	printer1_.printer_name as printer3_10_1_, 
	printer1_.display_name as display4_10_1_, 
	printer1_.location as location10_1_, 
	printer1_.notes as notes10_1_, 
	printer1_.charge_type as charge7_10_1_, 
	printer1_.default_cost as default8_10_1_, 
	printer1_.deleted as deleted10_1_, 
	printer1_.deleted_date as deleted10_10_1_, 
	printer1_.disabled as disabled10_1_, 
	printer1_.disabled_until as disabled12_10_1_, 
	printer1_.total_jobs as total13_10_1_, 
	printer1_.total_pages as total14_10_1_, 
	printer1_.total_sheets as total15_10_1_, 
	printer1_.reset_by as reset16_10_1_, 
	printer1_.reset_date as reset17_10_1_, 
	printer1_.created_date as created18_10_1_, 
	printer1_.created_by as created19_10_1_, 
	printer1_.modified_date as modified20_10_1_, 
	printer1_.modified_by as modified21_10_1_, 
	printer1_.color_detection_mode as color22_10_1_, 
	printer1_.device_type as device23_10_1_, 
	printer1_.ext_device_function as ext24_10_1_, 
	printer1_.physical_printer_id as physical25_10_1_, 
	printer1_.printer_type as printer26_10_1_, 
	printer1_.serial_number as serial27_10_1_, 
	printer1_.web_print_enabled as web28_10_1_, 
	printer1_.custom1 as custom29_10_1_, 
	printer1_.custom2 as custom30_10_1_, 
	printer1_.custom3 as custom31_10_1_, 
	printer1_.custom4 as custom32_10_1_, 
	printer1_.custom5 as custom33_10_1_, 
	printer1_.custom6 as custom34_10_1_, 
	printer1_.last_usage_date as last35_10_1_, 
	printer1_.gcp_printer_id as gcp36_10_1_, 
	printer1_.gcp_enabled as gcp37_10_1_, 
	user2_.user_name as user2_20_2_, 
	user2_.external_user_name as external3_20_2_, 
	user2_.full_name as full4_20_2_, 
	user2_.email as email20_2_, 
	user2_.notes as notes20_2_, 
	user2_.total_jobs as total7_20_2_, 
	user2_.total_pages as total8_20_2_, 
	user2_.total_sheets as total9_20_2_, 
	user2_.reset_by as reset10_20_2_, 
	user2_.reset_date as reset11_20_2_, 
	user2_.deleted as deleted20_2_, 
	user2_.deleted_date as deleted13_20_2_, 
	user2_.created_date as created14_20_2_,
	user2_.created_by as created15_20_2_, 
	user2_.modified_date as modified16_20_2_, 
	user2_.modified_by as modified17_20_2_,
	user2_.department as department20_2_,
	user2_.office as office20_2_, 
	user2_.card_number as card20_20_2_, 
	user2_.disabled_printing as disabled21_20_2_, 
	user2_.disabled_printing_until as disabled22_20_2_, 
	user2_.net_reset_by as net23_20_2_, 
	user2_.net_reset_date as net24_20_2_, 
	user2_.net_total_megabytes as net25_20_2_, 
	user2_.net_total_time_hours as net26_20_2_, 
	user2_.disabled_net as disabled27_20_2_, 
	user2_.disabled_net_until as disabled28_20_2_, 
	user2_.internal as internal20_2_, 
	user2_.last_user_activity as last30_20_2_, 
	user2_.card_number2 as card31_20_2_, 
	user2_.secondary_user_name as secondary32_20_2_
from 
	tbl_printer_usage_log printerusa0_ 
	inner join tbl_printer printer1_ on printerusa0_.printer_id=printer1_.printer_id 
	inner join tbl_user user2_ on printerusa0_.used_by_user_id=user2_.user_id 
	inner join tbl_account account3_ on printerusa0_.charged_to_account_id=account3_.account_id 
	inner join tbl_account account4_ on printerusa0_.assoc_with_account_id=account4_.account_id 
where 
	printerusa0_.usage_date>=DATEADD(DAY,-@days_to_report,getdate())  
	and printerusa0_.usage_allowed='Y' 
	and printerusa0_.refunded='N' 
	and printerusa0_.printed='Y' 
order by 
	user2_.user_name,	
	printerusa0_.usage_date asc 