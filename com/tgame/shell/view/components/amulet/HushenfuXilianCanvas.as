package com.tgame.shell.view.components.amulet
{
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class HushenfuXilianCanvas extends FPanel
   {
      
      public static const UI_SHENLONGHUSHENFU_HUFU_PUT_X:String = "UI_SHENLONGHUSHENFU_HUFU_PUT_X";
      
      public static const UI_SHENLONGHUSHENFU_HUFU_GET_X:String = "UI_SHENLONGHUSHENFU_HUFU_GET_X";
      
      public static const UI_SHENLONGHUSHENFU_START_X:String = "UI_SHENLONGHUSHENFU_START_X";
      
      public static const UI_SHENLONGHUSHENFU_HUIFU_X:String = "UI_SHENLONGHUSHENFU_HUIFU_X";
      
      private var putBtn:SmallButton;
      
      private var equipContainer:Sprite;
      
      private var itemContainer:Sprite;
      
      private var ft1:FTextArea;
      
      private var ft2:FTextArea;
      
      private var startBtn:SecondButton;
      
      private var huifuBtn:SecondButton;
      
      private var miaoshu1:FTextArea;
      
      private var miaoshu2:FTextArea;
      
      private var goodsText:FTextArea;
      
      public var check:FCheckBox;
      
      private var checkLabel:FLabel;
      
      private var ft:FTextArea;
      
      public function HushenfuXilianCanvas()
      {
         var v:Vector.<Bitmap>;
         var img:Bitmap = null;
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 327;
         height = 378;
         titleText = LanResManager.getLanCommonTextWords("神龙护身符洗炼");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = new Bitmap();
         img.name = "ui.equip.innate.attribute.streng.ui";
         addChild(img);
         img.x = 10;
         img.y = 2;
         v = new Vector.<Bitmap>();
         v.push(img);
         this.DynamicManageImages = v;
         this.putBtn = new SmallButton();
         this.putBtn.label = LanResManager.getLanCommonTextWords("放入护符");
         addChild(this.putBtn);
         this.putBtn.x = 15;
         this.putBtn.y = 10;
         this.putBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.miaoshu1 = new FTextArea();
         with(this.miaoshu1)
         {
            x = 81;
            y = 8;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         addChild(this.miaoshu1);
         this.miaoshu2 = new FTextArea();
         with(this.miaoshu2)
         {
            x = 81;
            y = 95;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         addChild(this.miaoshu2);
         this.equipContainer = new Sprite();
         addChild(this.equipContainer);
         this.equipContainer.x = 26;
         this.equipContainer.y = 44;
         this.itemContainer = new Sprite();
         addChild(this.itemContainer);
         this.itemContainer.x = 25;
         this.itemContainer.y = 251;
         this.goodsText = new FTextArea();
         with(this.goodsText)
         {
            x = 18;
            y = 230;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
         }
         addChild(this.goodsText);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 114;
            y = 240;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'4\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'  size=\'15\'>" + LanResManager.getLanCommonTextWords("当前武功加成") + "：</font>" + "</textformat>";
         }
         addChild(this.ft);
         this.ft1 = new FTextArea();
         with(this.ft1)
         {
            x = 115;
            y = 270;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         addChild(this.ft1);
         this.ft2 = new FTextArea();
         with(this.ft2)
         {
            x = 15;
            y = 197;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            visible = false;
         }
         addChild(this.ft2);
         this.startBtn = new SecondButton();
         this.startBtn.label = LanResManager.getLanCommonTextWords("开始洗炼");
         addChild(this.startBtn);
         this.startBtn.x = 30;
         this.startBtn.y = 310;
         this.startBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.huifuBtn = new SecondButton();
         this.huifuBtn.label = LanResManager.getLanCommonTextWords("武功还原");
         addChild(this.huifuBtn);
         this.huifuBtn.x = 175;
         this.huifuBtn.y = 310;
         this.huifuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.check = new FCheckBox();
         addChild(this.check);
         this.check.visible = false;
         this.check.selectState = false;
         this.check.x = 60 + 5;
         this.check.y = 310 - 35 + 5;
         this.checkLabel = new FLabel();
         this.checkLabel.visible = false;
         with(this.checkLabel)
         {
            x = check.x + 20;
            y = check.y - 1 + 2;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
         }
         addChild(this.checkLabel);
      }
      
      public function setPanelText(param1:int = 0) : void
      {
         switch(param1)
         {
            case 0:
               this.miaoshu1.htmlText = "<textformat leading=\'1\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("洗炼规则") + "：</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("1.将神龙护身符放入洗炼框") + "<br></font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("2.请将“辟邪剑谱”放入包裹") + "<br></font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("3.点“开始洗炼”按钮即可开始洗炼操作") + "<br></font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("4.在属性框中将出现新的武功层数加成") + "<br></font>" + "</textformat>";
               this.miaoshu2.htmlText = "<textformat leading=\'1\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("注意") + "：</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("只有神龙护身符才可以洗炼，洗炼后的护身") + "<br></font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("符的武功加成会随机发生变化，增加一层或") + "<br></font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("减少一层") + "！<br></font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("最低武功层数不低于10层，最高武功层数不") + "<br></font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("高于25层") + "<br></font>" + "</textformat>";
               titleText = LanResManager.getLanCommonTextWords("神龙护身符洗炼");
               this.goodsText.htmlText = "<textformat leading=\'1\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("辟邪剑谱") + "</font>" + "</textformat>";
               this.huifuBtn.visible = true;
               this.putBtn.label = LanResManager.getLanCommonTextWords("放入护符");
               this.startBtn.x = 30;
               this.startBtn.y = 310;
               break;
            case 1:
               this.miaoshu1.htmlText = "<textformat leading=\'1\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("洗炼规则") + "：</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("1.将勋章放入洗炼框") + "<br></font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("2.请将洗练道具放入包裹") + "<br></font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("3.点“开始洗炼”按钮即可开始洗炼操作") + "<br></font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("4.在属性框中将出现新的武功层数加成") + "<br></font>" + "</textformat>";
               this.miaoshu2.htmlText = "<textformat leading=\'1\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("注意") + "：</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("只有特殊勋章才可以洗炼，洗炼后的勋章") + "<br></font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("的武功加成会随机发生变化，增加一层或") + "<br></font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("减少一层") + "！<br></font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("最低武功层数不低于3层，最高武功层数不") + "<br></font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("高于12层") + "<br></font>" + "</textformat>";
               titleText = LanResManager.getLanCommonTextWords("勋章洗炼");
               this.goodsText.htmlText = "<textformat leading=\'1\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("洗练道具") + "</font>" + "</textformat>";
               this.huifuBtn.visible = false;
               this.putBtn.label = LanResManager.getLanCommonTextWords("放入勋章");
               this.startBtn.x = 78 + 50;
               this.startBtn.y = 310;
               break;
            case 2:
               this.miaoshu1.htmlText = "<textformat leading=\'1\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("洗炼规则") + "：</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("1.将神龙护身符放入洗炼框") + "<br></font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("2.请将洗练道具放入包裹") + "<br></font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("3.点“开始洗炼”按钮即可开始洗炼操作") + "<br></font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("4.在属性框中将出现新的武功层数及属性加成") + "<br></font>" + "</textformat>";
               this.miaoshu2.htmlText = "";
               titleText = LanResManager.getLanCommonTextWords("神龙护身符传说洗炼");
               this.goodsText.htmlText = "<textformat leading=\'1\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("洗练道具") + "</font>" + "</textformat>";
               this.huifuBtn.visible = false;
               this.putBtn.label = LanResManager.getLanCommonTextWords("放入护符");
               this.startBtn.x = 78 + 50;
               this.startBtn.y = 310;
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null && this != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.putBtn:
               if(this.putBtn.label == LanResManager.getLanCommonTextWords("取出护符") || this.putBtn.label == LanResManager.getLanCommonTextWords("取出勋章"))
               {
                  dispatchEvent(new BaseEvent(UI_SHENLONGHUSHENFU_HUFU_GET_X));
               }
               else
               {
                  dispatchEvent(new BaseEvent(UI_SHENLONGHUSHENFU_HUFU_PUT_X));
               }
               break;
            case this.startBtn:
               dispatchEvent(new BaseEvent(UI_SHENLONGHUSHENFU_START_X,"",this.check.selectState));
               break;
            case this.huifuBtn:
               dispatchEvent(new BaseEvent(UI_SHENLONGHUSHENFU_HUIFU_X));
         }
      }
      
      public function setEquip(param1:Goods) : void
      {
         while(this.equipContainer.numChildren > 0)
         {
            this.equipContainer.removeChildAt(0);
         }
         this.equipContainer.addChild(new ItemFace(param1));
         if(param1.res.xunZhangXiLian)
         {
            this.putBtn.label = LanResManager.getLanCommonTextWords("取出勋章");
         }
         else
         {
            this.putBtn.label = LanResManager.getLanCommonTextWords("取出护符");
         }
      }
      
      public function getEquip() : Goods
      {
         if(this.equipContainer.numChildren == 0)
         {
            return null;
         }
         var _loc1_:Goods = Goods((this.equipContainer.getChildAt(0) as ItemFace).getBaseItem());
         while(this.equipContainer.numChildren > 0)
         {
            this.equipContainer.removeChildAt(0);
         }
         if(_loc1_.res.xunZhangXiLian)
         {
            this.putBtn.label = LanResManager.getLanCommonTextWords("放入勋章");
         }
         else
         {
            this.putBtn.label = LanResManager.getLanCommonTextWords("放入护符");
         }
         return _loc1_;
      }
      
      public function setEnergyExpendItem(param1:Boolean, param2:Goods = null, param3:Goods = null) : void
      {
         while(this.itemContainer.numChildren > 0)
         {
            this.itemContainer.removeChildAt(0);
         }
         this.itemContainer.addChild(new ItemFace(param2));
         if(param1)
         {
            this.itemContainer.filters = [];
            this.startBtn.enabled = true;
         }
         else
         {
            this.startBtn.enabled = false;
            this.itemContainer.filters = Tools.blackWhiteFilter;
         }
         if(param3 != null)
         {
            this.check.visible = true;
            this.checkLabel.visible = true;
            this.checkLabel.text = LanResManager.getLanCommonTextWords("使用") + param3.res.name;
         }
         else
         {
            this.check.visible = false;
            this.checkLabel.visible = false;
         }
      }
      
      public function setBtn(param1:Boolean) : void
      {
         if(param1)
         {
            this.huifuBtn.enabled = true;
         }
         else
         {
            this.huifuBtn.enabled = false;
         }
      }
      
      public function setWugongText(param1:int) : void
      {
         if(param1 == 0)
         {
            this.ft.visible = false;
            this.ft1.x = 71;
            this.ft1.y = 245;
         }
         else
         {
            this.ft1.htmlText = "<textformat leading=\'1\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("所有武功层数") + " +" + param1 + LanResManager.getLanCommonTextWords("层") + "</font>" + "</textformat>";
         }
      }
      
      public function setSuccText(param1:Boolean, param2:int) : void
      {
         if(param1)
         {
            if(param2 == 1)
            {
               this.ft2.htmlText = "<textformat leading=\'1\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("恭喜您武功洗炼成功，增加了武功层数") + "！</font>" + "</textformat>";
            }
            else
            {
               this.ft2.htmlText = "<textformat leading=\'1\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("恭喜您的武功洗炼成功，恢复了武功层数") + "！</font>" + "</textformat>";
            }
            this.ft2.visible = true;
         }
         else
         {
            this.ft2.visible = false;
         }
      }
   }
}

