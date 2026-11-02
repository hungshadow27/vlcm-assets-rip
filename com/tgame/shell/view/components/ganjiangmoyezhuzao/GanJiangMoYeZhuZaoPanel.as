package com.tgame.shell.view.components.ganjiangmoyezhuzao
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   public class GanJiangMoYeZhuZaoPanel extends FPanel
   {
      
      public static const UI_GANJIANGMOYEZHUZAOPANEL_DUANZAOBTN_CLICK:String = "UI_GANJIANGMOYEZHUZAOPANEL_DUANZAOBTN_CLICK";
      
      private var fc1:FCanvas;
      
      private var gongImg:DisplayObject;
      
      private var gongImgObj:Object = {};
      
      private var duanZaoBtn:SecondButton;
      
      private var shuxing:FTextArea;
      
      private var yanhuaMc:MovieClip;
      
      private var tf:TextFormat;
      
      private var bg1:DisplayObject;
      
      public function GanJiangMoYeZhuZaoPanel()
      {
         var _loc1_:FTextArea = null;
         var _loc3_:FTextArea = null;
         super();
         this.tf = new TextFormat();
         this.tf.align = "center";
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 549 - 10 - 2;
         height = 389 + 45;
         titleText = LanResManager.getLanCommonTextWords("干将莫邪铸造");
         this.addEventListener(FCloseEvent.CLOSE,this._onclose);
         this.fc1 = new FCanvas();
         this.fc1.x = 10;
         this.fc1.y = 1;
         this.fc1.width = 118;
         this.fc1.height = 190 + 124 + 43;
         this.fc1.skin = "box";
         addChild(this.fc1);
         this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ganjiangmoye/bg.swf");
         this.bg1.visible = true;
         this.bg1.x = 128 - 1;
         this.bg1.y = 0;
         addChild(this.bg1);
         if(this.gongImg != null && this.gongImg.parent != null)
         {
            removeChild(this.gongImg);
         }
         if(this.gongImgObj[0] != null)
         {
            this.gongImg = this.gongImgObj[0];
         }
         else
         {
            this.gongImg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/UIditu/ganjiangmoye/01.swf",399,174);
            this.gongImgObj[0] = this.gongImg;
         }
         this.gongImg.x = 132;
         this.gongImg.y = 9;
         addChild(this.gongImg);
         _loc1_ = new FTextArea();
         _loc1_.multiline = true;
         _loc1_.autoSize = TextFieldAutoSize.LEFT;
         _loc1_.wordWrap = true;
         _loc1_.width = 400 - 3;
         _loc1_.height = 160;
         _loc1_.x = 129 + 5;
         _loc1_.y = 192 + 20 + 6;
         _loc1_.htmlText = "<textformat leading=\'0\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("干将莫邪铸造后将开启锻造者夫妻的干将莫邪兵器系统。并且在显示夫妻双方") + LanResManager.getLanCommonTextWords("的神器栏中出现") + "</font><font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("干将（男）") + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("或者") + "</font>" + "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("莫邪（女）") + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("，可以进行外观显示。") + LanResManager.getLanCommonTextWords("铸造干将莫邪时需要夫妻双方在组队状态，铸造时将扣除队长背包中的") + "</font>" + "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("侠侣碎片") + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("，因此在使用侠侣值兑换侠侣碎片时请双方决定好由谁来锻造神器！") + "<br>" + LanResManager.getLanCommonTextWords("开启干将莫邪后可以使用侠侣碎片进行神器强化增加神器的属性，并且可以使用") + "</font>" + "<font color=\'" + StaticValue
         .BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("神雕之羽") + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("幻化神器来改变神器的外形！") + LanResManager.getLanCommonTextWords("神雕之羽可以通过神雕情缘活动获得。请在“") + "</font>" + "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("我的配偶") + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("”界面中申请神雕情") + LanResManager.getLanCommonTextWords("缘活动。") + "</font></textformat>";
         addChild(_loc1_);
         this.shuxing = new FTextArea();
         this.shuxing.multiline = true;
         this.shuxing.autoSize = TextFieldAutoSize.LEFT;
         this.shuxing.wordWrap = true;
         this.shuxing.width = 250 + 80;
         this.shuxing.height = 96;
         this.shuxing.x = 132 + 45;
         this.shuxing.y = 192;
         var _loc2_:FTextArea = new FTextArea();
         _loc2_.multiline = true;
         _loc2_.autoSize = TextFieldAutoSize.LEFT;
         _loc2_.wordWrap = true;
         _loc2_.width = 100;
         _loc2_.height = 96;
         _loc2_.x = 42 - 20;
         _loc2_.y = 36 + 50 - 45;
         _loc2_.htmlText = "<textformat ><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("干将莫邪举世无双所获何人侠侣情长共甘共苦同来同往一生一世铸此情殇") + "</font></textformat>";
         addChild(_loc2_);
         _loc3_ = new FTextArea();
         _loc3_.multiline = true;
         _loc3_.autoSize = TextFieldAutoSize.LEFT;
         _loc3_.wordWrap = true;
         _loc3_.width = 88;
         _loc3_.height = 96;
         _loc3_.x = 18 + 6;
         _loc3_.y = 180 + 50;
         _loc3_.htmlText = "<textformat ><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("收集1314枚侠侣碎片方可锻造神器干将莫邪！") + "</font></textformat>";
         addChild(_loc3_);
         this.duanZaoBtn = new SecondButton();
         this.duanZaoBtn.label = LanResManager.getLanCommonTextWords("铸造");
         addChild(this.duanZaoBtn);
         this.duanZaoBtn.x = (this.width - this.duanZaoBtn.width) / 2;
         this.duanZaoBtn.y = 321 + 45;
         this.duanZaoBtn.addEventListener(MouseEvent.CLICK,this.duanZaoBtn_click);
      }
      
      public function showlihua() : void
      {
         if(Boolean(this.yanhuaMc) && this.yanhuaMc.parent != null)
         {
            this.yanhuaMc.parent.removeChild(this.yanhuaMc);
         }
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            yanhuaMc = _loc2_.content as MovieClip;
            yanhuaMc.x = 52 + 15 - 124;
            yanhuaMc.y = 60 - 182 - 6;
            addChild(yanhuaMc);
         },null,false,GameConfig.fileBaseFolder + "res/data/mc/aojianzhuzao/lihua.swf");
      }
      
      private function duanZaoBtn_click(param1:MouseEvent) : void
      {
         this.dispatchEvent(new BaseEvent(UI_GANJIANGMOYEZHUZAOPANEL_DUANZAOBTN_CLICK));
      }
      
      private function _onclose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setShuxingJiacheng(param1:int, param2:int, param3:int) : void
      {
         this.shuxing.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("干将莫邪初始属性：攻击:+") + param1 + LanResManager.getLanCommonTextWords("防御:+") + param2 + LanResManager.getLanCommonTextWords("武功:+") + param3 + "</font>";
      }
   }
}

