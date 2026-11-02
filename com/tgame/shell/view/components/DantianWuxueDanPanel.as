package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.shell.view.components.attribute.DantianWuxuedanJianyiCanvas;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class DantianWuxueDanPanel extends FPanel
   {
      
      public static const UI_DANTIANWUXUEDAN_SKILL_BOOK_COUNT:String = "UI_DANTIANWUXUEDAN_SKILL_BOOK_COUNT";
      
      private var fta:FTextArea;
      
      private var fta1:FTextArea;
      
      private var tf:TextFormat;
      
      private var img:Bitmap;
      
      private var xuexiBtn:SecondButton;
      
      private var buffSpr:Sprite;
      
      private var goItem:ItemFace;
      
      private var currShowItem:ItemFace;
      
      private var dantianwuxuedanjianyiCanvas:DantianWuxuedanJianyiCanvas;
      
      public function DantianWuxueDanPanel()
      {
         var i:int;
         super();
         dragAble = true;
         this.skin = "panel";
         this.showCloseButton = true;
         width = 425;
         height = 285;
         this.titleText = LanResManager.getLanCommonTextWords("神奇丹田武学丹");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 15;
            y = 10;
            textColor = StaticValue.YELLOW;
            htmlText = LanResManager.getLanCommonTextWords("您当前丹田修炼等级：");
         }
         addChild(this.fta);
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            x = 185;
            y = 10;
            textColor = StaticValue.WHITE;
            text = "";
         }
         addChild(this.fta1);
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 15;
            y = 30;
            textColor = StaticValue.YELLOW;
            htmlText = LanResManager.getLanCommonTextWords("当前等级下可以学习丹田武学：");
         }
         addChild(this.fta);
         i = 0;
         while(i < 8)
         {
            this.img = StaticValue.getBitmapByClassName("ui.tiem.slot");
            addChild(this.img);
            this.img.x = i * 48 + 25;
            this.img.y = 55;
            i++;
         }
         this.buffSpr = new Sprite();
         this.buffSpr.x = 27;
         this.buffSpr.y = 57;
         addChild(this.buffSpr);
         this.buffSpr.addEventListener(MouseEvent.CLICK,this.onSkillClick);
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 15;
            y = 100;
            textColor = StaticValue.YELLOW;
            htmlText = LanResManager.getLanCommonTextWords("神奇丹田武学丹：");
         }
         addChild(this.fta);
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 15;
            y = 120;
            textColor = StaticValue.WHITE;
            htmlText = LanResManager.getLanTextWords(this,"可以让您在不");
         }
         addChild(this.fta);
         this.img = StaticValue.getBitmapByClassName("ui.line");
         addChild(this.img);
         this.img.x = 10;
         this.img.y = 140;
         this.img.width = 405;
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 15;
            y = 148;
            textColor = StaticValue.YELLOW;
            htmlText = LanResManager.getLanCommonTextWords("操作步骤：");
         }
         addChild(this.fta);
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            width = 320;
            wordWrap = true;
            x = 15;
            y = 168;
            textColor = StaticValue.WHITE;
            htmlText = "<textformat leading=\'1\'>" + LanResManager.getLanTextWords(this,"请在上述武学面板中选择",[],false) + "</textformat>";
         }
         addChild(this.fta);
         this.img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.img);
         this.img.x = 350;
         this.img.y = 165;
         this.xuexiBtn = new SecondButton();
         this.xuexiBtn.label = LanResManager.getLanCommonTextWords("学习");
         addChild(this.xuexiBtn);
         this.xuexiBtn.x = 348;
         this.xuexiBtn.y = 210;
         this.xuexiBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.xuexiBtn:
               if(this.currShowItem)
               {
                  dispatchEvent(new BaseEvent(UI_DANTIANWUXUEDAN_SKILL_BOOK_COUNT,"",this.currShowItem.getBaseItem().id));
               }
         }
      }
      
      private function onSkillClick(param1:MouseEvent) : void
      {
         var _loc2_:ItemFace = param1.target as ItemFace;
         if((_loc2_.getBaseItem() as Skill).isLearn == 0)
         {
            this.xuexiBtn.enabled = true;
         }
         else
         {
            this.xuexiBtn.enabled = false;
         }
         if(this.currShowItem)
         {
            this.currShowItem.showKungFuFram = false;
         }
         _loc2_.showKungFuFram = true;
         this.currShowItem = _loc2_;
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setInitialize(param1:int, param2:Array) : void
      {
         var _loc3_:ItemFace = null;
         var _loc4_:Skill = null;
         this.xuexiBtn.enabled = false;
         if(param1 == 1)
         {
            this.fta1.text = LanResManager.getLanCommonTextWords("一级【乾】");
         }
         else if(param1 == 2)
         {
            this.fta1.text = LanResManager.getLanCommonTextWords("二级【兑】");
         }
         else if(param1 == 3)
         {
            this.fta1.text = LanResManager.getLanCommonTextWords("三级【离】");
         }
         else if(param1 == 4)
         {
            this.fta1.text = LanResManager.getLanCommonTextWords("四级【震】");
         }
         else if(param1 == 5)
         {
            this.fta1.text = LanResManager.getLanCommonTextWords("五级【巽】");
         }
         else if(param1 == 6)
         {
            this.fta1.text = LanResManager.getLanCommonTextWords("六级【坎】");
         }
         else if(param1 == 7)
         {
            this.fta1.text = LanResManager.getLanCommonTextWords("七级【艮】");
         }
         else if(param1 == 8)
         {
            this.fta1.text = LanResManager.getLanCommonTextWords("八级【坤】");
         }
         else if(param1 < 1)
         {
            this.fta1.text = LanResManager.getLanCommonTextWords("一级【乾】");
         }
         if(this.dantianwuxuedanjianyiCanvas != null && this.dantianwuxuedanjianyiCanvas.parent != null)
         {
            this.dantianwuxuedanjianyiCanvas.parent.removeChild(this.dantianwuxuedanjianyiCanvas);
         }
         if(param1 != 8 && param1 > 0)
         {
            this.dantianwuxuedanjianyiCanvas = new DantianWuxuedanJianyiCanvas();
            addChild(this.dantianwuxuedanjianyiCanvas);
            this.dantianwuxuedanjianyiCanvas.y = 250;
         }
         while(this.buffSpr.numChildren > 0)
         {
            this.buffSpr.removeChildAt(0);
         }
         var _loc5_:int = 0;
         while(_loc5_ < param2.length)
         {
            _loc4_ = param2[_loc5_];
            _loc3_ = new ItemFace(_loc4_);
            _loc3_.showKungFuTag();
            _loc3_.x = _loc5_ * 48;
            this.buffSpr.addChild(_loc3_);
            _loc5_++;
         }
      }
      
      public function setGoods(param1:Goods) : void
      {
         if(this.goItem != null && this.goItem.parent != null)
         {
            this.goItem.parent.removeChild(this.goItem);
         }
         this.goItem = new ItemFace(param1);
         this.goItem.x = 352;
         this.goItem.y = 167;
         addChild(this.goItem);
      }
   }
}

