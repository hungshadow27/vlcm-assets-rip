package com.tgame.shell.view.components.fabao
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   
   public class FabaoGuanzhuDesc extends FPanel
   {
      
      private var ft:FTextArea;
      
      public function FabaoGuanzhuDesc()
      {
         super();
         width = 250;
         height = 355;
         dragAble = true;
         showCloseButton = true;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         titleText = LanResManager.getLanCommonTextWords("法宝灌注说明");
         this.init();
      }
      
      public function onClose(param1:FCloseEvent = null) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         this.ft = new FTextArea();
         this.ft.x = 15;
         this.ft.y = 5;
         this.ft.width = 210;
         this.ft.height = 305;
         this.ft.wordWrap = true;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("法宝提升等级后") + "<br>" + LanResManager.getLanCommonTextWords("获得更多的属性加成") + "<br>" + LanResManager.getLanCommonTextWords("并可以解锁高级法宝技能") + "<br><br></font>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("法宝提升需要灵力和道具") + "<br>" + LanResManager.getLanCommonTextWords("灵力：吸收天地精华获得") + "<br>" + LanResManager.getLanCommonTextWords("道具：商城购买") + "<br><br></font>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("灵力：") + "<br>" + LanResManager.getLanCommonTextWords("点击血条下方的法宝命脉内息") + "<br>" + LanResManager.getLanCommonTextWords("和灵力条，可开启灵力界面") + "<br><br></font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("获得灵力值") + "<br>" + LanResManager.getLanCommonTextWords("每在线10秒钟，将获得一次灵力值。") + "<br><br></font>" + "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager
         .getLanCommonTextWords("灵力丹") + "<br>" + LanResManager.getLanCommonTextWords("灵力值满10000点，可在灵力") + "<br>" + LanResManager.getLanCommonTextWords("界面下将灵力值化为灵力丹，") + "<br>" + LanResManager.getLanCommonTextWords("非绑定可交易") + "</font>";
         addChild(this.ft);
      }
   }
}

