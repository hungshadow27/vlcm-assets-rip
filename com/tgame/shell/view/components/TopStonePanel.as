package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.BaseItem;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class TopStonePanel extends FPanel
   {
      
      public static const TOPSTONEPANEL_STONE_PUT:String = "TOPSTONEPANEL_STONE_PUT";
      
      public static const TOPSTONEPANEL_STONE_GET:String = "TOPSTONEPANEL_STONE_GET";
      
      public static const TOPSTONEPANEL_STONE_STRAT:String = "TOPSTONEPANEL_STONE_STRAT";
      
      private var btn:SmallButton;
      
      private var stone1:ItemFace;
      
      private var stone2:ItemFace;
      
      private var item:ItemFace;
      
      private var okBtn:SecondButton;
      
      private var tips:FTextArea;
      
      public function TopStonePanel()
      {
         var v:Vector.<Bitmap>;
         var ft:FTextArea;
         var bg:Bitmap = null;
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 327;
         height = 398;
         this.titleText = LanResManager.getLanCommonTextWords("顶级宝石合成");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         bg = new Bitmap();
         bg.name = "ui.topStone.make.ui";
         addChild(bg);
         bg.x = 10;
         v = new Vector.<Bitmap>();
         v.push(bg);
         this.DynamicManageImages = v;
         ft = new FTextArea();
         with(ft)
         {
            x = 15;
            y = 10;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'4\'>" + LanResManager.getLanTextWords(this,"通过“纯净碧玺”可以将",[StaticValue.ORANGE_HTML]) + "</textformat>";
         }
         addChild(ft);
         this.tips = new FTextArea();
         this.tips.x = 82;
         this.tips.y = 220;
         this.tips.autoSize = TextFieldAutoSize.LEFT;
         this.tips.textColor = StaticValue.WHITE;
         this.tips.filters = StaticValue.filter;
         addChild(this.tips);
         ft = new FTextArea();
         with(ft)
         {
            x = 82;
            y = 276;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'4\'>" + LanResManager.getLanTextWords(this,"每种尊七品宝石均已自带+100加成属性") + "</textformat>";
         }
         addChild(ft);
         this.btn = new SmallButton();
         this.btn.label = LanResManager.getLanCommonTextWords("放入宝石");
         addChild(this.btn);
         this.btn.x = 18;
         this.btn.y = 111;
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("开始合成");
         addChild(this.okBtn);
         this.okBtn.x = (327 - this.okBtn.width) / 2;
         this.okBtn.y = 330;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btn:
               if(this.btn.label == LanResManager.getLanCommonTextWords("取出宝石"))
               {
                  dispatchEvent(new BaseEvent(TOPSTONEPANEL_STONE_GET));
               }
               else
               {
                  dispatchEvent(new BaseEvent(TOPSTONEPANEL_STONE_PUT));
               }
               break;
            case this.okBtn:
               dispatchEvent(new BaseEvent(TOPSTONEPANEL_STONE_STRAT));
         }
      }
      
      public function setStone(param1:BaseItem, param2:BaseItem) : void
      {
         if(Boolean(this.stone1) && Boolean(this.stone1.parent))
         {
            this.stone1.parent.removeChild(this.stone1);
         }
         if(param1)
         {
            this.stone1 = new ItemFace(param1);
            addChild(this.stone1);
            this.stone1.x = 27;
            this.stone1.y = 133;
            this.btn.label = LanResManager.getLanCommonTextWords("取出宝石");
         }
         else
         {
            this.btn.label = LanResManager.getLanCommonTextWords("放入宝石");
         }
         if(Boolean(this.stone2) && Boolean(this.stone2.parent))
         {
            this.stone2.parent.removeChild(this.stone2);
         }
         if(param2)
         {
            this.stone2 = new ItemFace(param2);
            addChild(this.stone2);
            this.stone2.x = 27;
            this.stone2.y = 275;
         }
      }
      
      public function setItem(param1:BaseItem) : void
      {
         if(Boolean(this.item) && Boolean(this.item.parent))
         {
            this.item.parent.removeChild(this.item);
         }
         if(param1)
         {
            this.item = new ItemFace(param1);
            addChild(this.item);
            this.item.x = 175;
            this.item.y = 142;
            if(param1.count > 0)
            {
               this.item.filters = [];
            }
            else
            {
               this.item.filters = Tools.blackWhiteFilter;
            }
         }
      }
      
      public function setCailiao(param1:int, param2:int, param3:String) : void
      {
         var _loc4_:String = GameInstance.mainCharData.attributeInfo.gqNow < param1 ? StaticValue.RED_HTML : StaticValue.GREEN_HTML;
         var _loc5_:String = this.item.getBaseItem().count > 0 ? StaticValue.GREEN_HTML : StaticValue.RED_HTML;
         this.tips.htmlText = "<textformat leading=\'\'>" + LanResManager.getLanCommonTextWords("本次合成需要真气：") + "<font color=\'" + _loc4_ + "\'>" + param1 + "</font><br>" + LanResManager.getLanCommonTextWords("本次合成成功几率：") + param2 + "%<br>" + LanResManager.getLanCommonTextWords("本次合成需要：") + "<font color=\'" + _loc5_ + "\'>" + param3 + "</font>" + "</textformat>";
      }
   }
}

