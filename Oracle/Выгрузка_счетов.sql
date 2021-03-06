-- Скрипт для формирования выгрузки
BEGIN
  -- Иницилизируем сессию
  MAIN.INIT(
    vch_VC_IP        => '127.0.0.1',
    vch_VC_USER      => '_login',
    vch_VC_PASS      => '_password',
    vch_VC_APP_CODE  => 'NETSERV_ARM_ISP',
    vch_VC_CLN_APPID => 'my app info');
 
  MAIN.SET_ACTIVE_FIRM(
    num_N_FIRM_ID    => 100);
  
  -- Запускаем формирование выгрузки
  ACC_MAIN_PKG.INIT(
    tbl_N_FIRM_IDS       => AIS_NET.NUMBER_TABLE(100),
    tbl_N_SUBJ_GROUP_IDS => AIS_NET.NUMBER_TABLE( 40231101,
                                                  40231201,
                                                  40250801,
                                                  50448701,
                                                  50448801,
                                                  50448901,
                                                  50484401,
                                                  50484501,
                                                  50484601,
                                                  50484701,
                                                  50484801,
                                                  50484901,
                                                  50485001,
                                                  50485101,
                                                  50485201,
                                                  50485301,
                                                  50485401,
                                                  50485501,
                                                  50485601,
                                                  50485701,
                                                  50485801,
                                                  50485901,
                                                  50486001,
                                                  50486101,
                                                  50486201,
                                                  50486301,
                                                  50486401,
                                                  50486501,
                                                  50486601,
                                                  50486701,
                                                  50486801,
                                                  50486901,
                                                  50487001,
                                                  50487101,
                                                  50487201,
                                                  50487301,
                                                  50487401,
                                                  50487501,
                                                  50487601,
                                                  50487701,
                                                  50491901,
                                                  50492001,
                                                  50492101,
                                                  57127901,
                                                  212592001,
                                                  300860501,
                                                  300882701,
                                                  301055301,
                                                  301068501,
                                                  372817701),
    dt_D_BEGIN           => TO_DATE('01.05.2014 00:00:00', 'DD.MM.YYYY HH24:MI:SS'),
    dt_D_END             => TO_DATE('31.05.2014 23:59:59', 'DD.MM.YYYY HH24:MI:SS'),
    num_N_FORMAT_VER_ID  => sys_context('CONST', 'ACC_UNLOAD_VERSION_1c8'));
    
  acc_main_pkg.unload_section(num_n_acc_section_id => sys_context('CONST', 'ACC_SECTION_Bills'));
  
  acc_main_pkg.unload_all;
END;

-- Данные хранятся в TT_V_ACC_LINES
-- Нужно сделать выборку с этой таблицы и заэкспортить в txt с расширением xml
SELECT VC_TEXT
FROM TT_V_ACC_LINES
ORDER BY N_LINE_NO
