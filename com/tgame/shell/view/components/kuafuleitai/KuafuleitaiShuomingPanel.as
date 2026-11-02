package com.tgame.shell.view.components.kuafuleitai
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   
   public class KuafuleitaiShuomingPanel extends FPanel
   {
      
      public function KuafuleitaiShuomingPanel()
      {
         var _loc1_:FTextArea = null;
         super();
         dragAble = true;
         this.skin = "sceondPanel";
         this.showCloseButton = true;
         width = 613;
         height = 410;
         this.titleText = LanResManager.getLanCommonTextWords("跨服擂台规则及玩法");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         _loc1_ = new FTextArea();
         _loc1_.x = 11;
         _loc1_.y = 5;
         var _loc2_:String = "<textformat>" + "<font size=\'12\' color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("活动开放时间") + "<br></font>" + "<font size=\'12\' color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("每天13:0019:00开放(其它时间不得报名参加)") + "<br></font>" + "<font size=\'12\' color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("进入要求") + "<br></font>" + "<font size=\'12\' color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("初级擂台战斗力限制为3000070000") + "<br></font>" + "<font size=\'12\' color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("中级擂台战斗力限制为70001110000") + "<br></font>" + "<font size=\'12\' color=\'" + StaticValue.ORANGE_RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("高级擂台战斗力限制为110001及以上") + "<br></font>" + "<font size=\'12\' color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("玩家只可以单人进入,不支持组队进入") + "<br></font>" + "<font size=\'12\' color=\'" + StaticValue
         .ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("擂台介绍") + "<br></font>" + "<font size=\'12\' color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("跨服擂台11条规则") + "<font size=\'12\' color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("擂台奖励") + "<br></font>" + "<font size=\'12\' color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("获胜将获得与参加人数相关的一定数量的元宝奖励") + "<br></font>" + "<font size=\'12\' color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("失败不获得任何奖励") + "<br></font>" + "</textformat>";
         _loc1_.htmlText = _loc2_;
         _loc1_.filters = StaticValue.filter;
         _loc1_.width = 600;
         _loc1_.height = 370;
         addChild(_loc1_);
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
   }
}

