package com.tgame.shell.view.components.aojianzhuzao
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   
   public class AoJianZhuZaoPanel extends FPanel
   {
      
      public static const UI_AOJIANZHUZAOPANEL_DUANZAOBTN_CLICK:String = "ui_aojianzhuzaopanel_duanzaobtn_click";
      
      public static const UI_AOJIANZHUZAOPANEL_SETDAOJU_CLICK:String = "ui_aojianzhuzaopanel_setdaoju_click";
      
      private var fc1:FCanvas;
      
      private var fc2:FCanvas;
      
      private var fc3:FCanvas;
      
      private var duanZaoBtn:SecondButton;
      
      private var setDaojuBtn:FButton;
      
      private var text1:FTextArea;
      
      private var text2:FTextArea;
      
      private var text3:FTextArea;
      
      private var text4:FTextArea;
      
      private var item:ItemFace;
      
      private var chacheMc:Object;
      
      private var mcUrl:String = "";
      
      private var tip:FTextArea;
      
      private var tipCanvas:FCanvas;
      
      private var check:FCheckBox;
      
      private var checkLabel:FLabel;
      
      public function AoJianZhuZaoPanel()
      {
         var img:Bitmap;
         var bg:F9GridBitmap = null;
         this.chacheMc = {"aojian":null};
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 549;
         height = 389;
         titleText = LanResManager.getLanCommonTextWords("傲剑铸造");
         this.addEventListener(FCloseEvent.CLOSE,this._onclose);
         this.fc3 = new FCanvas();
         this.fc3.x = 9;
         this.fc3.y = 0;
         this.fc3.width = 118;
         this.fc3.height = 127;
         this.fc3.skin = "box_transparence";
         addChild(this.fc3);
         this.fc1 = new FCanvas();
         this.fc1.x = 9;
         this.fc1.y = 124;
         this.fc1.width = 118;
         this.fc1.height = 190;
         this.fc1.skin = "box";
         addChild(this.fc1);
         this.fc2 = new FCanvas();
         this.fc2.x = 126;
         this.fc2.y = 245;
         this.fc2.width = 415;
         this.fc2.height = 70;
         this.fc2.skin = "box_transparence";
         addChild(this.fc2);
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         this.tip.x = 2;
         this.tip.y = 2;
         this.tip.autoSize = TextFieldAutoSize.LEFT;
         this.tip.textColor = StaticValue.WHITE;
         this.tip.filters = StaticValue.filter;
         this.tipCanvas.addChild(this.tip);
         bg = Tools.get9GridBitmpByName("aojianzhuzao_bg");
         addChild(bg);
         bg.width = 407;
         bg.height = 174 + 15;
         bg.x = 128;
         bg.y = 2;
         this.mcUrl = GameConfig.fileBaseFolder + "res/data/mc/aojianzhuzao/aojian.swf";
         if(this.chacheMc["aojian"] == null)
         {
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               if(_loc2_.content)
               {
                  chacheMc["aojian"] = _loc2_.content as MovieClip;
                  addChild(chacheMc["aojian"]);
                  addChild(bg);
                  chacheMc["aojian"].x = 131;
                  chacheMc["aojian"].y = 9;
               }
            },null,false,this.mcUrl);
         }
         else
         {
            addChild(this.chacheMc["aojian"]);
            addChild(bg);
            this.chacheMc["aojian"].x = 131;
            this.chacheMc["aojian"].y = 9;
         }
         addChild(bg);
         img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(img);
         img.x = 52;
         img.y = 40;
         this.setDaojuBtn = new SmallButton();
         this.setDaojuBtn.x = 44;
         this.setDaojuBtn.y = 17;
         this.setDaojuBtn.label = LanResManager.getLanCommonTextWords("放入道具");
         addChild(this.setDaojuBtn);
         this.setDaojuBtn.addEventListener(MouseEvent.CLICK,this.setDaojuBtn_click);
         this.text1 = new FTextArea();
         with(this.text1)
         {
            width = 400;
            height = 72;
            x = 129;
            y = 192;
            filters = StaticValue.filter;
            mouseEnabled = false;
            textColor = StaticValue.GREEN;
            htmlText = LanResManager.getLanCommonTextWords("属性加成：攻击：+888888 防御：+288888 生命：+8000000") + "<br>" + LanResManager.getLanCommonTextWords("特殊属性：【天道】：战斗时有每次攻击无论是否命中必定恢复自身血量5%") + "<br>" + "\t\t\t" + LanResManager.getLanCommonTextWords("【臣服】：战斗时有额外5%的几率将对手从坐骑上击落");
         }
         addChild(this.text1);
         this.text2 = new FTextArea();
         with(this.text2)
         {
            width = 405;
            height = 150;
            x = 129;
            y = 228 + 20;
            wordWrap = true;
            filters = StaticValue.filter;
            mouseEnabled = false;
            textColor = StaticValue.WHITE;
            htmlText = "<textformat leading=\'1\'>" + LanResManager.getLanCommonTextWords("傲剑描述：") + "<br>" + LanResManager.getLanCommonTextWords("传说诞生在天地初开，混沌之中，历经悠久岁月，形成的绝世神兵。拥有着毁天灭地，吞噬诸界，穿梭太虚，静止时间的无穷力量。此剑一出，天地色变，万物臣服！") + "</textformat>";
         }
         addChild(this.text2);
         this.text3 = new FTextArea();
         with(this.text3)
         {
            width = 106;
            height = 150;
            x = 18;
            y = 136;
            wordWrap = true;
            filters = StaticValue.filter;
            mouseEnabled = false;
            textColor = StaticValue.WHITE;
            htmlText = "<textformat leading=\'4\'>" + LanResManager.getLanCommonTextWords("当玩家收集了500个【傲剑碎片】才可以再次铸造至尊利刃--【傲剑】") + "</textformat>";
         }
         addChild(this.text3);
         this.text4 = new FTextArea();
         with(this.text4)
         {
            width = 165;
            height = 41;
            x = 13;
            y = 86;
            filters = StaticValue.filter;
            mouseEnabled = false;
            textColor = StaticValue.ORANGE;
            htmlText = "<textformat leading=\'4\'>" + LanResManager.getLanCommonTextWords("当前材料:") + "</textformat><br>" + LanResManager.getLanCommonTextWords("【傲剑碎片】×");
         }
         addChild(this.text4);
         this.check = new FCheckBox();
         addChild(this.check);
         this.check.x = 9;
         this.check.y = 321;
         this.checkLabel = new FLabel();
         with(this.checkLabel)
         {
            x = check.x + 20;
            y = 321;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("傲剑碎片翻倍卡");
         }
         this.checkLabel.addEventListener(MouseEvent.MOUSE_OVER,this.onCheckTip);
         this.checkLabel.addEventListener(MouseEvent.MOUSE_OUT,this.onCheckTip);
         addChild(this.checkLabel);
         this.duanZaoBtn = new SecondButton();
         this.duanZaoBtn.label = LanResManager.getLanCommonTextWords("铸造");
         addChild(this.duanZaoBtn);
         this.duanZaoBtn.x = (this.width - this.duanZaoBtn.width) / 2;
         this.duanZaoBtn.y = 321;
         this.duanZaoBtn.addEventListener(MouseEvent.CLICK,this.duanZaoBtn_click);
         this.reset();
      }
      
      private function onCheckTip(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.checkLabel.addEventListener(MouseEvent.MOUSE_MOVE,this.onCheckTip);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("使用【傲剑碎片翻倍卡】可以减少一半【傲剑碎片】的数量，快速获得【傲剑】") + "</font></textformat>";
               this.showTip(_loc2_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.checkLabel.removeEventListener(MouseEvent.MOUSE_MOVE,this.onCheckTip);
         }
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = mouseX + 5;
         this.tipCanvas.y = mouseY + 5;
      }
      
      public function SetGoods(param1:int, param2:int) : void
      {
         this.showAojianSuiPianNum(param2);
         this.setDaojuBtn.label = LanResManager.getLanCommonTextWords("取出道具");
         var _loc3_:Goods = new Goods(param1);
         if(this.item)
         {
            if(this.item.parent)
            {
               this.item.parent.removeChild(this.item);
            }
            this.item = null;
         }
         this.item = new ItemFace(_loc3_);
         this.item.x = 54;
         this.item.y = 42;
         this.item.setShowCount(false);
         addChild(this.item);
      }
      
      public function reset() : void
      {
         if(this.item)
         {
            if(this.item.parent)
            {
               this.item.parent.removeChild(this.item);
            }
            this.item = null;
         }
         this.setDaojuBtn.label = LanResManager.getLanCommonTextWords("放入道具");
         this.text4.visible = false;
         this.text4.htmlText = "";
      }
      
      public function showAojianSuiPianNum(param1:int) : void
      {
         this.text4.visible = true;
         this.text4.htmlText = "<textformat leading=\'4\'>" + LanResManager.getLanCommonTextWords("当前材料:") + "</textformat><br>" + LanResManager.getLanCommonTextWords("【傲剑碎片】×") + param1;
      }
      
      protected function setDaojuBtn_click(param1:MouseEvent) : void
      {
         if(this.setDaojuBtn.label == LanResManager.getLanCommonTextWords("放入道具"))
         {
            this.dispatchEvent(new BaseEvent(UI_AOJIANZHUZAOPANEL_SETDAOJU_CLICK,"",1));
         }
         else
         {
            this.dispatchEvent(new BaseEvent(UI_AOJIANZHUZAOPANEL_SETDAOJU_CLICK,"",2));
         }
      }
      
      protected function duanZaoBtn_click(param1:MouseEvent) : void
      {
         this.dispatchEvent(new BaseEvent(UI_AOJIANZHUZAOPANEL_DUANZAOBTN_CLICK,"",this.check.selectState ? 1 : 0));
      }
      
      private function _onclose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
   }
}

