@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cds Development Test'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ztc_cds_demo
  as select from    ekko
    inner join      ekpo on ekko.ebeln = ekpo.ebeln
    inner join      mara on mara.matnr = ekpo.matnr
    inner join      lfa1 on lfa1.lifnr = ekko.lifnr
    left outer join makt on  makt.matnr = mara.matnr
                         and makt.spras = $session.system_language

{
  ekpo.ebeln,
  ekpo.ebelp,
  ekpo.matnr,
  makt.maktx,
  ekpo.werks,
  ekpo.lgort,
  ekpo.meins,
  lfa1.lifnr,
  lfa1.name1,
  concat( lfa1.stras, lfa1.mcod3 ) as Satici_adresi
}
