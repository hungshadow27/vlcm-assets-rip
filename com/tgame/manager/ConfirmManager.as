package com.tgame.manager
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   
   public class ConfirmManager
   {
      
      public function ConfirmManager()
      {
         super();
      }
      
      public static function confirmBreak3v3Baoming(param1:Function, param2:Function = null) : void
      {
         var $okCallBack:Function = param1;
         var $cancelCallBack:Function = param2;
         var msg:String = "";
         msg += "<font color=\'" + StaticValue.YELLOW_HTML + "\'>";
         msg += LanResManager.getLanCommonTextWords("队伍当前处于跨服战场报名状态") + "\n";
         msg += "</font>";
         msg += "<font color=\'" + StaticValue.RED_HTML + "\'>";
         msg += LanResManager.getLanCommonTextWords("以下操作将会导致整支队伍取消跨服战场的报名：") + "\n";
         msg += LanResManager.getLanCommonTextWords("1：新增队伍成员") + "\n";
         msg += LanResManager.getLanCommonTextWords("2：请离队伍成员") + "\n";
         msg += LanResManager.getLanCommonTextWords("3：队员退出队伍") + "\n";
         msg += LanResManager.getLanCommonTextWords("4：变更队长") + "\n";
         msg += LanResManager.getLanCommonTextWords("5：队员换线") + "\n";
         msg += LanResManager.getLanCommonTextWords("6：队员进入副本") + "\n";
         msg += "</font>";
         msg += "<font color=\'" + StaticValue.YELLOW_HTML + "\'>";
         msg += LanResManager.getLanCommonTextWords("要进行以上操作需要先取消跨服战场报名，您确认要继续吗？") + "\n";
         msg += "</font>";
         FAlert.okLabel = LanResManager.getLanCommonTextWords("取消报名,继续操作");
         FAlert.cancelLabel = LanResManager.getLanCommonTextWords("保留报名");
         FAlert.show(msg,"",2,function(param1:FAlertEvent):void
         {
            if(param1.eventData == FAlert.OK)
            {
               if($okCallBack != null)
               {
                  $okCallBack();
               }
            }
            else if($cancelCallBack != null)
            {
               $cancelCallBack();
            }
         });
      }
   }
}

