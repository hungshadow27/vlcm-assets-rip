package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class ProposalAffirmPanel extends FPanel
   {
      
      public static const UI_LAUNCHPROPOSALPANEL_CHAKANZILIAO_CLICK:String = "UI_LAUNCHPROPOSALPANEL_CHAKANZILIAO_CLICK";
      
      public static const UI_LAUNCHPROPOSALPANEL_QIUHUN_CLICK:String = "UI_LAUNCHPROPOSALPANEL_QIUHUN_CLICK";
      
      public static const UI_LAUNCHPROPOSALPANEL_JUJUE_CLICK:String = "UI_LAUNCHPROPOSALPANEL_JUJUE_CLICK";
      
      private var ft:FTextArea;
      
      private var ft1:FTextArea;
      
      private var ft2:FTextArea;
      
      private var fangruBtn:SmallButton;
      
      private var goumaiBtn:SmallButton;
      
      private var ckzlBtn:SecondButton;
      
      private var qhBtn:SecondButton;
      
      private var myCloseBtn:SecondButton;
      
      private var touxiangImg:Bitmap;
      
      private var container:Sprite;
      
      private var yupeishopPanel:YupeiShopPanel;
      
      private var wanjiaId:int;
      
      public function ProposalAffirmPanel()
      {
         var v:Vector.<Bitmap>;
         var bg:Bitmap = null;
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         this.dragRestrict = false;
         width = 393;
         height = 495;
         titleText = LanResManager.getLanCommonTextWords("求婚确认");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         bg = new Bitmap();
         bg.name = "ui.marriage.propose.ui";
         addChild(bg);
         bg.x = 10;
         bg.y = 2;
         v = new Vector.<Bitmap>();
         v.push(bg);
         this.DynamicManageImages = v;
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 90;
            y = 10;
            wordWrap = true;
            width = 115;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
            htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanTextWords(this,0) + "</font></textformat>";
         }
         addChild(this.ft);
         this.ft1 = new FTextArea();
         with(this.ft1)
         {
            x = 126;
            y = 10;
            wordWrap = true;
            width = 115;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanTextWords(this,1) + "</font></textformat>";
         }
         addChild(this.ft1);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 216;
            y = 10;
            wordWrap = true;
            width = 115;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanTextWords(this,2) + "</font></textformat>";
         }
         addChild(this.ft);
         this.ft2 = new FTextArea();
         with(this.ft2)
         {
            x = 252;
            y = 10;
            wordWrap = true;
            width = 115;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanTextWords(this,3) + "</font></textformat>";
         }
         addChild(this.ft2);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 90;
            y = 46;
            wordWrap = true;
            width = 315;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.RED;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanTextWords(this,4);
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 19;
            y = 77;
            wordWrap = true;
            width = 315;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.RED;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanTextWords(this,5);
         }
         addChild(this.ft);
         this.container = new Sprite();
         addChild(this.container);
         this.container.x = 33;
         this.container.y = 125;
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 19;
            y = 178;
            wordWrap = true;
            width = 455;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.RED;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'2\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanTextWords(this,6) + "</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,7) + "</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,8) + "</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,9) + "</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,10) + "</font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,11) + "</font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,12) + "</font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,13) + "</font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this
            ,14) + "</font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,15) + "</font><br>" + "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + LanResManager.getLanTextWords(this,16) + "</font><br>" + "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + LanResManager.getLanTextWords(this,17) + "</font><br>" + "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + LanResManager.getLanTextWords(this,18) + "</font><br>" + "</textformat>";
         }
         addChild(this.ft);
         this.ckzlBtn = new SecondButton();
         this.ckzlBtn.label = LanResManager.getLanCommonTextWords("查看资料");
         addChild(this.ckzlBtn);
         this.ckzlBtn.x = 65;
         this.ckzlBtn.y = 428;
         this.ckzlBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.qhBtn = new SecondButton();
         this.qhBtn.label = LanResManager.getLanTextWords(this,"同意求婚");
         addChild(this.qhBtn);
         this.qhBtn.x = 180;
         this.qhBtn.y = 428;
         this.qhBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.myCloseBtn = new SecondButton();
         this.myCloseBtn.label = LanResManager.getLanCommonTextWords("拒绝");
         addChild(this.myCloseBtn);
         this.myCloseBtn.x = 280;
         this.myCloseBtn.y = 428;
         this.myCloseBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.fangruBtn:
            case this.goumaiBtn:
               break;
            case this.ckzlBtn:
               dispatchEvent(new BaseEvent(UI_LAUNCHPROPOSALPANEL_CHAKANZILIAO_CLICK,"",this.wanjiaId));
               break;
            case this.qhBtn:
               dispatchEvent(new BaseEvent(UI_LAUNCHPROPOSALPANEL_QIUHUN_CLICK));
               break;
            case this.myCloseBtn:
               dispatchEvent(new BaseEvent(UI_LAUNCHPROPOSALPANEL_JUJUE_CLICK));
         }
      }
      
      public function setInitialize(param1:String, param2:String, param3:String, param4:String, param5:String, param6:int) : void
      {
         if(this.touxiangImg != null && this.touxiangImg.parent != null)
         {
            this.touxiangImg.parent.removeChild(this.touxiangImg);
         }
         this.touxiangImg = new Bitmap(new BitmapData(35,35,true,0));
         this.touxiangImg.x = 31;
         this.touxiangImg.y = 16;
         addChild(this.touxiangImg);
         this.touxiangImg.bitmapData = StaticValue.getBitmapByClassName(param1).bitmapData;
         this.touxiangImg.width = 40;
         this.touxiangImg.height = 40;
         this.ft1.htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + param2 + "<br>" + param3 + "</font></textformat>";
         this.ft2.htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + param4 + "<br>" + param5 + "</font></textformat>";
         this.wanjiaId = param6;
      }
      
      public function setYupei(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc3_:ItemFace = null;
         while(this.container.numChildren > 0)
         {
            this.container.removeChildAt(0);
         }
         _loc2_ = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = new ItemFace(param1[_loc2_]);
            this.container.addChild(_loc3_);
            if(_loc2_ == 0)
            {
               _loc3_.x = 0;
            }
            else if(_loc2_ == 1)
            {
               _loc3_.x = 75;
            }
            else if(_loc2_ == 2)
            {
               _loc3_.x = 120;
            }
            else if(_loc2_ == 3)
            {
               _loc3_.x = 178;
            }
            else if(_loc2_ == 4)
            {
               _loc3_.x = 223;
            }
            _loc2_++;
         }
      }
      
      public function onClose(param1:FCloseEvent = null) : void
      {
         while(this.container.numChildren > 0)
         {
            this.container.removeChildAt(0);
         }
         if(this.touxiangImg != null && this.touxiangImg.parent != null)
         {
            this.touxiangImg.parent.removeChild(this.touxiangImg);
         }
         this.ft1.htmlText = "";
         this.ft2.htmlText = "";
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
   }
}

