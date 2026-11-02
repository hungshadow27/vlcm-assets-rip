package com.tgame.shell.view.components.huodong
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   
   public class JiHuoRouShenShuXingPanel extends FPanel
   {
      
      public static const UI_JIHUOSHUXING_CLICK:String = "UI_JIHUOSHUXING_CLICK";
      
      private var ft:FTextArea;
      
      private var ft1:FTextArea;
      
      private var djBit1:Bitmap;
      
      private var djBit2:Bitmap;
      
      private var djBit3:Bitmap;
      
      private var btn:SecondButton;
      
      private var menuContainer:FCanvas;
      
      private var ifItem1:ItemFace;
      
      private var ifItem2:ItemFace;
      
      private var ifItem3:ItemFace;
      
      private var gName1:String;
      
      private var gName2:String;
      
      private var _modal:Boolean;
      
      public function JiHuoRouShenShuXingPanel()
      {
         super();
         this.skin = "panel_btn";
         this.showCloseButton = true;
         dragAble = true;
         width = 252;
         height = 301;
         titleText = LanResManager.getLanCommonTextWords("肉身隐藏属性激活");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.setUI();
      }
      
      public function setUI() : void
      {
         this.ft1 = new FTextArea();
         this.ft1.x = 11;
         this.ft1.y = 5;
         this.ft1.width = 218 + 4;
         this.ft1.autoSize = TextFieldAutoSize.LEFT;
         this.ft1.wordWrap = true;
         this.ft1.textColor = StaticValue.WHITE;
         this.ft1.htmlText = "<textformat leading=\'0.1\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("特殊加成属性全解答:") + "<br></font>" + "<font color = \'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("无字天书（上卷）*1000 + 无字天书（下卷）*1000") + "</font>，" + LanResManager.getLanCommonTextWords("可激活隐藏属性") + "</textformat>";
         addChild(this.ft1);
         this.ft = new FTextArea();
         this.ft.x = 11;
         this.ft.y = 153 - 8;
         this.ft.width = 218 + 15;
         this.ft.autoSize = TextFieldAutoSize.LEFT;
         this.ft.wordWrap = true;
         this.ft.htmlText = "<textformat leading=\'0.1\'>" + "<font color = \'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("肉身达到八层可以在此激活其隐藏属性。") + "</font>" + "<font color =\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("激活后，将获得体内潜在属性点（1000点），属性点将随机进行分配（属性点可以通过洗髓丹进行重新分配哦）") + "</font></textformat>";
         addChild(this.ft);
         this.menuContainer = new FCanvas();
         this.menuContainer.skin = "backGroud";
         addChild(this.menuContainer);
         this.menuContainer.width = 232;
         this.menuContainer.height = 80;
         this.menuContainer.x = 10;
         this.menuContainer.y = 66;
         this.btn = new SecondButton();
         this.btn.label = LanResManager.getLanTextWords(this,"激活");
         addChild(this.btn);
         this.btn.x = width / 2 - this.btn.width / 2;
         this.btn.y = 235;
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btn:
               this.dispatchEvent(new BaseEvent(UI_JIHUOSHUXING_CLICK));
               this.onClose();
         }
      }
      
      public function setGoods1(param1:Goods = null, param2:Boolean = true) : void
      {
         this.djBit1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.djBit1.x = 50 - 2;
         this.djBit1.y = 88;
         addChild(this.djBit1);
         if(this.ifItem1 != null && this.ifItem1.parent != null)
         {
            this.ifItem1.parent.removeChild(this.ifItem1);
         }
         if(param1 == null)
         {
            return;
         }
         this.gName1 = param1.res.name;
         this.ifItem1 = new ItemFace(param1);
         this.ifItem1.x = 50 - 2 + 2;
         this.ifItem1.y = 90;
         if(param1.count == 0)
         {
            this.ifItem1.filters = Tools.blackWhiteFilter;
         }
         if(param2 == false)
         {
            this.ifItem1.filters = Tools.blackWhiteFilter;
         }
         addChild(this.ifItem1);
         if(this.gName2 != null)
         {
            this.ft1.htmlText = "<textformat leading=\'0.1\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("特殊加成属性全解答:") + "<br></font>" + "<font color = \'" + StaticValue.GREEN_HTML + "\'>" + this.gName1 + "*1000 + " + this.gName2 + "*1000" + "</font>，" + LanResManager.getLanCommonTextWords("可激活隐藏属性") + "</textformat>";
         }
         else
         {
            this.ft1.htmlText = "<textformat leading=\'0.1\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("特殊加成属性全解答:") + "<br></font>" + "<font color = \'" + StaticValue.GREEN_HTML + "\'>" + this.gName1 + "*1000" + "</font>，" + LanResManager.getLanCommonTextWords("可激活隐藏属性") + "</textformat>";
         }
      }
      
      public function setGoods2(param1:Goods = null, param2:Boolean = true) : void
      {
         this.djBit2 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.djBit2.x = 170 - 2;
         this.djBit2.y = 88;
         addChild(this.djBit2);
         if(this.ifItem2 != null && this.ifItem2.parent != null)
         {
            this.ifItem2.parent.removeChild(this.ifItem2);
         }
         if(param1 == null)
         {
            return;
         }
         this.gName2 = param1.res.name;
         this.ifItem2 = new ItemFace(param1);
         this.ifItem2.x = 170 - 2 + 2;
         this.ifItem2.y = 90;
         if(param1.count == 0)
         {
            this.ifItem2.filters = Tools.blackWhiteFilter;
         }
         if(param2 == false)
         {
            this.ifItem2.filters = Tools.blackWhiteFilter;
         }
         addChild(this.ifItem2);
         if(this.gName1 != null)
         {
            this.ft1.htmlText = "<textformat leading=\'0.1\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("特殊加成属性全解答:") + "<br></font>" + "<font color = \'" + StaticValue.GREEN_HTML + "\'>" + this.gName1 + "*1000 + " + this.gName2 + "*1000" + "</font>，" + LanResManager.getLanCommonTextWords("可激活隐藏属性") + "</textformat>";
         }
         else
         {
            this.ft1.htmlText = "<textformat leading=\'0.1\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("特殊加成属性全解答:") + "<br></font>" + "<font color = \'" + StaticValue.GREEN_HTML + "\'>" + this.gName2 + "*1000" + "</font>，" + LanResManager.getLanCommonTextWords("可激活隐藏属性") + "</textformat>";
         }
      }
      
      public function setGoods3(param1:Goods = null, param2:Boolean = true) : void
      {
         if(param1.id == 43130)
         {
            height = 335;
            this.btn.y = 235 + 34;
         }
         else
         {
            height = 301;
            this.btn.y = 235;
         }
         this.djBit3 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.djBit3.x = (this.width - this.djBit3.width) / 2;
         this.djBit3.y = 88;
         addChild(this.djBit3);
         if(this.ifItem3 != null && this.ifItem3.parent != null)
         {
            this.ifItem3.parent.removeChild(this.ifItem3);
         }
         if(param1 == null)
         {
            return;
         }
         this.ifItem3 = new ItemFace(param1);
         this.ifItem3.x = (this.width - this.djBit3.width) / 2 + 2;
         this.ifItem3.y = 90;
         if(param1.count == 0)
         {
            this.ifItem3.filters = Tools.blackWhiteFilter;
         }
         if(param2 == false)
         {
            this.ifItem3.filters = Tools.blackWhiteFilter;
         }
         addChild(this.ifItem3);
      }
      
      public function reItem() : void
      {
         if(this.ifItem3 != null && this.ifItem3.parent != null)
         {
            this.ifItem3.parent.removeChild(this.ifItem3);
         }
         if(this.djBit3 != null && this.djBit3.parent != null)
         {
            this.djBit3.parent.removeChild(this.djBit3);
         }
         if(this.ifItem2 != null && this.ifItem2.parent != null)
         {
            this.ifItem2.parent.removeChild(this.ifItem2);
         }
         if(this.djBit2 != null && this.djBit2.parent != null)
         {
            this.djBit2.parent.removeChild(this.djBit2);
         }
         if(this.ifItem1 != null && this.ifItem1.parent != null)
         {
            this.ifItem1.parent.removeChild(this.ifItem1);
         }
         if(this.djBit1 != null && this.djBit1.parent != null)
         {
            this.djBit1.parent.removeChild(this.djBit1);
         }
      }
      
      public function setGongjianShuxing() : void
      {
         titleText = LanResManager.getLanCommonTextWords("弓箭隐藏属性激活");
         this.ft.htmlText = "<textformat leading=\'0.1\'>" + "<font color = \'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("弓箭达到七阶可以在此激活其隐藏属性。") + "</font>" + "<font color =\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("激活后，将获得体内潜在属性点（点），属性点将随机进行分配（属性点可以通过洗髓丹进行重新分配哦）") + "</font></textformat>";
      }
      
      public function setDantianShuxing() : void
      {
         titleText = LanResManager.getLanCommonTextWords("丹田隐藏属性激活");
         this.ft.htmlText = "<textformat leading=\'0.1\'>" + "<font color = \'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("丹田达到八阶可以在此激活其隐藏属性。") + "</font>" + "<font color =\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("激活后，将获得体内潜在属性点（588点）,攻击+1500，防御+750，属性点将随机进行分配（属性点可以通过洗髓丹进行重新分配哦）") + "</font></textformat>";
      }
      
      public function setBuguaShuxing() : void
      {
         titleText = LanResManager.getLanCommonTextWords("八卦掌隐藏属性激活");
         this.ft.htmlText = "<textformat leading=\'0.1\'>" + "<font color = \'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("八卦掌达到八阶可以在此激活其隐藏属性。") + "</font>" + "<font color =\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("激活后，将获得体内潜在属性点（点）属性点将随机进行分配（属性点可以通过洗髓丹进行重新分配哦）") + "</font></textformat>";
      }
      
      public function setDuGuJiuJianShuxing() : void
      {
         titleText = LanResManager.getLanCommonTextWords("独孤九剑隐藏属性激活");
         this.ft.htmlText = "<textformat leading=\'1\'><font color = \'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("独孤九剑领悟第九式方可在此激活隐藏属性。") + "</font>" + "<font color =\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("激活后，将获得体内潜在属性点（点）属性点将随机进行分配（九剑+九阳）") + "</font></textformat>";
      }
      
      public function setJiuYangShuxing() : void
      {
         titleText = LanResManager.getLanCommonTextWords("九阳神功隐藏属性激活");
         this.ft.htmlText = "<textformat leading=\'1\'><font color = \'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("九阳神功领悟第九重方可在此激活隐藏属性。") + "</font>" + "<font color =\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("激活后，将获得体内潜在属性点（点）属性点将随机进行分配（九剑+九阳）") + "</font></textformat>";
      }
      
      public function setDantianJinjie(param1:String, param2:String, param3:String, param4:Boolean) : void
      {
         if(param4)
         {
            titleText = LanResManager.getLanCommonTextWords("丹田进阶激活");
         }
         else
         {
            titleText = LanResManager.getLanCommonTextWords("丹田进阶");
         }
         this.btn.label = param3;
         this.ft1.htmlText = param1;
         this.ft.htmlText = param2;
      }
      
      public function setTuLongDao() : void
      {
         titleText = LanResManager.getLanCommonTextWords("屠龙刀隐藏属性激活");
         this.ft1.htmlText = "<font color = \'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("特殊加成属性全解答：") + "<br>" + LanResManager.getLanCommonTextWords("屠龙刀进阶秘籍*8888，可激活隐藏属性") + "</font></textformat>";
         this.ft.htmlText = "<font color = \'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("屠龙刀全灌注达到满层可以在此激活隐藏属性。激活后，将可获得屠龙刀隐藏潜能所有门派武学江湖武学和帮派武学全部增加6层。并且激活炫酷外观烈焰屠龙。") + "</font></textformat>";
      }
   }
}

