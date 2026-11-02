package com.tgame.shell.view.components.attribute
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class ShenZhaoJingTisuPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var item:ItemFace;
      
      private var fta:FTextArea;
      
      private var fta1:FTextArea;
      
      private var GoumaiBtn:SecondButton;
      
      private var KaishitisuBtn:SecondButton;
      
      private var ShiyongquanbuBtn:SecondButton;
      
      private var QuxiaoBtn:SecondButton;
      
      private var lb:FLabel;
      
      private var ftDest:FTextArea;
      
      private var goodsId:int;
      
      public function ShenZhaoJingTisuPanel()
      {
         var bg:Bitmap;
         var v:Vector.<Bitmap>;
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 320;
         height = 170;
         titleText = LanResManager.getLanTextWords(this,"修炼提速");
         bg = new Bitmap();
         bg.name = "ui.dongxiao.tisu.ui";
         addChild(bg);
         bg.x = 10;
         bg.y = 2;
         v = new Vector.<Bitmap>();
         v.push(bg);
         this.DynamicManageImages = v;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.GoumaiBtn = new SecondButton();
         this.GoumaiBtn.label = LanResManager.getLanCommonTextWords("购买");
         this.GoumaiBtn.x = 27;
         this.GoumaiBtn.y = 71;
         this.GoumaiBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.fta = new FTextArea();
         with(this.fta)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            width = 65;
            height = 60;
            x = 90;
            y = 5;
            textColor = StaticValue.BlUE20;
            htmlText = "<textformat leading=\'8\'>" + LanResManager.getLanCommonTextWords("武功名称：") + "<br>" + LanResManager.getLanCommonTextWords("当前层数：") + "<br>" + LanResManager.getLanCommonTextWords("熟练度：") + "<br>" + "</textformat>";
         }
         addChild(this.fta);
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            width = 65;
            height = 60;
            x = 155;
            y = 7;
            textColor = StaticValue.WHITE;
            htmlText = "";
         }
         addChild(this.fta1);
         this.ftDest = new FTextArea();
         with(this.ftDest)
         {
            x = 82;
            y = 78;
            width = 225;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("提升50点熟练度，需要消耗1颗神照提速丹");
         }
         addChild(this.ftDest);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 7;
            y = 14;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         addChild(this.lb);
         this.KaishitisuBtn = new SecondButton();
         this.KaishitisuBtn.label = LanResManager.getLanCommonTextWords("开始提速");
         addChild(this.KaishitisuBtn);
         this.KaishitisuBtn.x = 32;
         this.KaishitisuBtn.y = 105;
         this.KaishitisuBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.ShiyongquanbuBtn = new SecondButton();
         this.ShiyongquanbuBtn.label = LanResManager.getLanCommonTextWords("使用全部");
         addChild(this.ShiyongquanbuBtn);
         this.ShiyongquanbuBtn.x = 140;
         this.ShiyongquanbuBtn.y = 105;
         this.ShiyongquanbuBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.QuxiaoBtn = new SecondButton();
         this.QuxiaoBtn.label = LanResManager.getLanCommonTextWords("取消");
         addChild(this.QuxiaoBtn);
         this.QuxiaoBtn.x = 245;
         this.QuxiaoBtn.y = 105;
         this.QuxiaoBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
      }
      
      public function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function onCloseFun() : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.GoumaiBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SHENZHAOJING_XIULIANTISU_GOUMAI_CLICK,"",this.goodsId));
               break;
            case this.KaishitisuBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SHENZHAOJING_XIULIANTISU_ONE_CLICK));
               break;
            case this.ShiyongquanbuBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SHENZHAOJING_XIULIANTISU_ALL_CLICK));
               break;
            case this.QuxiaoBtn:
               if(parent != null)
               {
                  parent.removeChild(this);
               }
         }
      }
      
      public function setDangqianInitialize(param1:String, param2:String, param3:int, param4:int, param5:Goods) : void
      {
         this.fta1.htmlText = "<textformat leading=\'8\'>" + LanResManager.getLanCommonTextWords("神照经") + "<br>" + param1 + LanResManager.getLanCommonTextWords("段") + "<br>" + param2 + "<br>" + "</textformat>";
         this.ftDest.htmlText = LanResManager.getLanCommonTextWords("提升50点熟练度，需要消耗1颗神照提速丹");
         this.lb.htmlText = param5.res.name;
         if(this.item != null)
         {
            removeChild(this.item);
         }
         this.goodsId = param5.id;
         this.item = new ItemFace(param5);
         this.item.x = 32;
         this.item.y = 32;
         addChild(this.item);
         var _loc6_:int = (this.item.getBaseItem() as Goods).count;
         if(_loc6_ <= 0)
         {
            this.item.filters = Tools.blackWhiteFilter;
         }
      }
   }
}

