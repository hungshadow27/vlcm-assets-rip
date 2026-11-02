package com.tgame.shell.view.components.amulet
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.AmuletPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class SheliziMakeCanvas extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      public var bg:Bitmap;
      
      private var ft1:FTextArea;
      
      private var startBtn:SecondButton;
      
      private var putBtn:SmallButton;
      
      private var it1:ItemFace;
      
      private var it2:ItemFace;
      
      private var it3:ItemFace;
      
      private var helpBtn:FSimpleButton;
      
      private var useJLJH:FCheckBox;
      
      private var useJLJH2:FCheckBox;
      
      private var _zhenqi:int;
      
      private var _enoughZhenqi:Boolean;
      
      private var _count:int;
      
      private var _enoughCount:Boolean;
      
      private var _jilv:int;
      
      public function SheliziMakeCanvas()
      {
         var ft:FTextArea;
         var img:Bitmap = null;
         super();
         this.bg = new Bitmap();
         this.bg.name = "ui.amulet.sarira.refine.ui";
         addChild(this.bg);
         this.putBtn = new SmallButton();
         this.putBtn.label = LanResManager.getLanCommonTextWords("放入舍利");
         addChild(this.putBtn);
         this.putBtn.x = 7;
         this.putBtn.y = 10;
         this.putBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         ft = new FTextArea();
         with(ft)
         {
            x = 71;
            y = 6;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'0\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,"舍利子进阶合成：") + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanTextWords(this,"合成成功后您将获得更高级别舍利子") + "</font>" + "</textformat>";
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 71;
            y = 76;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanTextWords(this,"进阶合成步骤说明",[StaticValue.ORANGE_HTML,StaticValue.WHITE_HTML,StaticValue.GREEN_HTML],false) + "</textformat>";
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 71;
            y = 146;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanTextWords(this,"若进阶失败只回收聚灵珠和铜币不会",[StaticValue.WHITE_HTML,StaticValue.BLUE_HTML],false) + "</textformat>";
         }
         addChild(ft);
         img = StaticValue.getBitmapByClassName("ui.amulet.text.julingzhu");
         addChild(img);
         img.x = 15;
         img.y = 225;
         this.useJLJH = new FCheckBox();
         this.useJLJH.textColor = StaticValue.YELLOW;
         this.useJLJH.text = LanResManager.getLanCommonTextWords("使用聚灵精华");
         this.useJLJH.x = 71;
         this.useJLJH.y = 218;
         this.useJLJH.visible = false;
         this.useJLJH.addEventListener(MouseEvent.CLICK,this.updateData);
         addChild(this.useJLJH);
         this.useJLJH2 = new FCheckBox();
         this.useJLJH2.textColor = StaticValue.YELLOW;
         this.useJLJH2.text = LanResManager.getLanCommonTextWords("使用神奇舍利提升丹");
         this.useJLJH2.x = 71;
         this.useJLJH2.y = 218;
         this.useJLJH2.visible = false;
         this.useJLJH2.addEventListener(MouseEvent.CLICK,this.updateData);
         addChild(this.useJLJH2);
         this.ft1 = new FTextArea();
         with(this.ft1)
         {
            x = 71;
            y = 238;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'6\'>" + LanResManager.getLanTextWords(this,"本次操作消耗铜币");
         }
         addChild(this.ft1);
         this.startBtn = new SecondButton();
         this.startBtn.label = LanResManager.getLanCommonTextWords("开始进阶");
         addChild(this.startBtn);
         this.startBtn.x = (307 - this.startBtn.width) / 2;
         this.startBtn.y = 310;
         this.startBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.helpBtn = new FSimpleButton();
         this.helpBtn.skin = "helpBtn";
         addChild(this.helpBtn);
         this.helpBtn.x = 20;
         this.helpBtn.y = 309;
         this.helpBtn.addEventListener(MouseEvent.CLICK,this.showHelp);
         this.helpBtn.visible = false;
      }
      
      private function get useGoodsType() : int
      {
         if(this.useJLJH.visible && this.useJLJH.selectState)
         {
            return 1;
         }
         if(this.useJLJH2.visible && this.useJLJH2.selectState)
         {
            return 2;
         }
         return 0;
      }
      
      private function showHelp(param1:MouseEvent) : void
      {
         if(HelpManager.getVisable(HelpManager.UI_HELP_TYPE_SELIZI_HECHENG))
         {
            HelpManager.hideHelp(HelpManager.UI_HELP_TYPE_SELIZI_HECHENG);
         }
         else
         {
            HelpManager.showHelp(this.$parent,HelpManager.UI_HELP_TYPE_SELIZI_HECHENG);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.putBtn:
               if(this.putBtn.label == LanResManager.getLanCommonTextWords("取出舍利"))
               {
                  this.$parent.dispatchEvent(new BaseEvent(AmuletPanel.UI_SHELIZI_PANEL_MAKE_GET_STONE));
               }
               else
               {
                  this.$parent.dispatchEvent(new BaseEvent(AmuletPanel.UI_SHELIZI_PANEL_MAKE_PUT_STONE));
               }
               break;
            case this.startBtn:
               this.$parent.dispatchEvent(new BaseEvent(AmuletPanel.UI_SHELIZI_PANEL_MAKE_START,"",this.useGoodsType));
         }
      }
      
      public function setShelizi(param1:Goods = null, param2:Goods = null) : void
      {
         if(Boolean(this.it1) && Boolean(this.it1.parent))
         {
            this.it1.parent.removeChild(this.it1);
         }
         if(param1)
         {
            this.it1 = new ItemFace(param1);
            addChild(this.it1);
            this.it1.x = 16;
            this.it1.y = 43;
            this.putBtn.label = LanResManager.getLanCommonTextWords("取出舍利");
         }
         else
         {
            this.putBtn.label = LanResManager.getLanCommonTextWords("放入舍利");
         }
         if(Boolean(this.it2) && Boolean(this.it2.parent))
         {
            this.it2.parent.removeChild(this.it2);
         }
         if(param2)
         {
            this.it2 = new ItemFace(param2);
            addChild(this.it2);
            this.it2.x = 16;
            this.it2.y = 165;
         }
      }
      
      public function setData(param1:int, param2:Boolean, param3:int, param4:Boolean, param5:int) : void
      {
         this._zhenqi = param1;
         this._enoughZhenqi = param2;
         this._count = param3;
         this._enoughCount = param4;
         this._jilv = param5;
         this.updateData();
      }
      
      public function updateData(param1:* = null) : void
      {
         var _loc2_:int = this._count;
         if(this.useGoodsType == 1)
         {
            _loc2_ = this._count - 1;
         }
         if(this.useGoodsType == 2)
         {
            _loc2_ = 0;
         }
         _loc2_ = Math.max(0,_loc2_);
         var _loc3_:String = "";
         var _loc4_:String = "";
         if(this._enoughZhenqi)
         {
            _loc3_ = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + this._zhenqi + "</font>";
         }
         else
         {
            _loc3_ = "<font color=\'" + StaticValue.RED_HTML + "\'>" + this._zhenqi + "</font>";
         }
         if(this._enoughCount)
         {
            _loc4_ = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + _loc2_ + "</font>";
         }
         else
         {
            _loc4_ = "<font color=\'" + StaticValue.RED_HTML + "\'>" + _loc2_ + "</font>";
         }
         this.ft1.htmlText = "<textformat leading=\'6\'>" + LanResManager.getLanTextWords(this,"本次操作消耗铜币聚灵珠",[_loc3_,_loc4_,this._jilv]) + "</textformat>";
         this.useJLJH.visible = GameState.gongneng158;
         this.useJLJH2.visible = GameState.gongneng160;
      }
      
      public function setLingzhu(param1:int = 0, param2:Goods = null) : void
      {
         if(Boolean(this.it3) && Boolean(this.it3.parent))
         {
            this.it3.parent.removeChild(this.it3);
         }
         if(param2)
         {
            this.it3 = new ItemFace(param2);
            addChild(this.it3);
            this.it3.x = 16;
            this.it3.y = 248;
            if(param1 != 0)
            {
               this.it3.filters = [];
            }
            else
            {
               this.it3.filters = Tools.blackWhiteFilter;
            }
         }
      }
      
      public function reset() : void
      {
         this.setShelizi();
         this.setData(0,false,0,false,0);
         this.setLingzhu();
      }
   }
}

