package com.tgame.shell.view.components.attribute
{
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   
   public class Wulizhi extends Sprite
   {
      
      public var _parent:DisplayObject;
      
      private var fc1:FCanvas;
      
      private var ft1:FTextArea;
      
      private var ft2:FTextArea;
      
      private var ft3:FTextArea;
      
      private var ft4:FTextArea;
      
      private var ft5:FTextArea;
      
      private var equipContainer:Sprite;
      
      private var ft_b:FTextArea;
      
      private var ft_b1:FTextArea;
      
      private var tarenPd:Boolean = true;
      
      public var bgImg:Bitmap;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var tiao1:Bitmap;
      
      private var Scroll:FVScorllBar;
      
      private var fengmangFt:FTextArea;
      
      private var fengmangNum:FTextArea;
      
      private var xunzhangNum:FTextArea;
      
      private var bg1:DisplayObject;
      
      private var meiyinNum:int = 0;
      
      private var fts1:FTextArea;
      
      private var checkZq:FCheckBox;
      
      public function Wulizhi()
      {
         super();
         this.fc1 = new FCanvas();
         this.fc1.x = 0;
         this.fc1.y = 0;
         this.fc1.width = 404;
         this.fc1.height = 365;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.bgImg = new Bitmap();
         this.bgImg.name = "ui.char.xunzhang.bg";
         addChild(this.bgImg);
         this.bgImg.x = 2;
         this.bgImg.y = 2;
         this.tiao1 = StaticValue.getBitmapByClassName("ui.char.xunzhang.tiao");
         this.tiao1.x = 5;
         this.tiao1.y = 32;
         this.tiao1.width = 394;
         this.tiao1.height = 55 * 5 - 8;
         addChild(this.tiao1);
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         this.tip.x = 2;
         this.tip.y = 4;
         this.tip.autoSize = TextFieldAutoSize.LEFT;
         this.tip.textColor = StaticValue.WHITE;
         this.tip.filters = StaticValue.filter;
         this.tipCanvas.addChild(this.tip);
         this.ft1 = new FTextArea();
         this.ft1.x = 43;
         this.ft1.y = 10;
         this.ft1.name = "1";
         this.ft1.autoSize = TextFieldAutoSize.LEFT;
         this.ft1.textColor = StaticValue.GOLD;
         this.ft1.filters = StaticValue.filter;
         this.ft1.htmlText = "<textformat leading=\'6\'><font size=\'14\'>" + LanResManager.getLanCommonTextWords("勇气") + "</font></textformat>";
         addChild(this.ft1);
         this.ft1.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip1);
         this.ft1.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip1);
         this.ft2 = new FTextArea();
         this.ft2.x = 110;
         this.ft2.y = 10;
         this.ft2.name = "2";
         this.ft2.autoSize = TextFieldAutoSize.LEFT;
         this.ft2.textColor = StaticValue.GOLD;
         this.ft2.filters = StaticValue.filter;
         this.ft2.htmlText = "<textformat leading=\'6\'><font size=\'14\'>" + LanResManager.getLanCommonTextWords("坚韧") + "</font></textformat>";
         addChild(this.ft2);
         this.ft2.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip1);
         this.ft2.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip1);
         this.ft3 = new FTextArea();
         this.ft3.x = 165;
         this.ft3.y = 10;
         this.ft3.name = "3";
         this.ft3.autoSize = TextFieldAutoSize.LEFT;
         this.ft3.textColor = StaticValue.GOLD;
         this.ft3.filters = StaticValue.filter;
         this.ft3.htmlText = "<textformat leading=\'6\'><font size=\'14\'>" + LanResManager.getLanCommonTextWords("狂暴") + "</font></textformat>";
         addChild(this.ft3);
         this.ft3.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip1);
         this.ft3.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip1);
         this.ft4 = new FTextArea();
         this.ft4.x = 233;
         this.ft4.y = 10;
         this.ft4.name = "4";
         this.ft4.autoSize = TextFieldAutoSize.LEFT;
         this.ft4.textColor = StaticValue.GOLD;
         this.ft4.filters = StaticValue.filter;
         this.ft4.htmlText = "<textformat leading=\'6\'><font size=\'14\'>" + LanResManager.getLanCommonTextWords("灵巧") + "</font></textformat>";
         addChild(this.ft4);
         this.ft4.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip1);
         this.ft4.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip1);
         this.ft5 = new FTextArea();
         this.ft5.x = 315;
         this.ft5.y = 10;
         this.ft5.name = "5";
         this.ft5.autoSize = TextFieldAutoSize.LEFT;
         this.ft5.textColor = StaticValue.GOLD;
         this.ft5.filters = StaticValue.filter;
         this.ft5.htmlText = "<textformat leading=\'6\'><font size=\'14\'>" + LanResManager.getLanCommonTextWords("生命") + "</font></textformat>";
         addChild(this.ft5);
         this.ft5.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip1);
         this.ft5.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip1);
         this.equipContainer = new Sprite();
         this.equipContainer.x = 3;
         this.equipContainer.y = 34;
         with(this.equipContainer.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,380,266);
            endFill();
         }
         this.equipContainer.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick,false,30);
         addChild(this.equipContainer);
         this.Scroll = new FVScorllBar(this.equipContainer,266);
         addChild(this.Scroll);
         this.Scroll.x = 382;
         this.Scroll.y = 34;
         this.ft_b = new FTextArea();
         this.ft_b.x = 10;
         this.ft_b.y = 300;
         this.ft_b.autoSize = TextFieldAutoSize.LEFT;
         this.ft_b.textColor = StaticValue.ORANGE;
         this.ft_b.filters = StaticValue.filter;
         this.ft_b.htmlText = LanResManager.getLanCommonTextWords("勋章系统说明：");
         addChild(this.ft_b);
         this.ft_b1 = new FTextArea();
         this.ft_b1.x = 10;
         this.ft_b1.y = 315;
         this.ft_b1.wordWrap = true;
         this.ft_b1.width = 385;
         this.ft_b1.textColor = StaticValue.SKY_BLUE;
         this.ft_b1.filters = StaticValue.filter;
         this.ft_b1.htmlText = LanResManager.getLanCommonTextWords("将不同的勋章镶嵌到对应的勋章栏中可以获得不同的属性加成。勋章共五种，分为勇气、坚韧、狂暴、灵巧、生命。");
         addChild(this.ft_b1);
         this.fengmangFt = new FTextArea();
         this.fengmangFt.x = 10;
         this.fengmangFt.y = 305;
         this.fengmangFt.autoSize = TextFieldAutoSize.LEFT;
         this.fengmangFt.textColor = StaticValue.ORANGE;
         this.fengmangFt.filters = StaticValue.filter;
         this.fengmangFt.htmlText = LanResManager.getLanCommonTextWords("王者锋芒效果（最终版）：");
         addChild(this.fengmangFt);
         this.fengmangNum = new FTextArea();
         this.fengmangNum.x = 10;
         this.fengmangNum.y = 325;
         this.fengmangNum.autoSize = TextFieldAutoSize.LEFT;
         this.fengmangNum.filters = StaticValue.filter;
         this.fengmangNum.htmlText = "";
         addChild(this.fengmangNum);
         this.xunzhangNum = new FTextArea();
         this.xunzhangNum.x = 10;
         this.xunzhangNum.y = 345;
         this.xunzhangNum.autoSize = TextFieldAutoSize.LEFT;
         this.xunzhangNum.filters = StaticValue.filter;
         this.xunzhangNum.htmlText = "";
         addChild(this.xunzhangNum);
         this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/zhanqixitong/wanzi.swf");
         this.bg1.x = 2 + 350 + 8;
         this.bg1.y = 2 + 16 + 21;
         addChild(this.bg1);
         ToolTips.createToolTips(this.bg1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("当期已使用") + meiyinNum + LanResManager.getLanCommonTextWords("个美音迦南") + "<br>" + LanResManager.getLanCommonTextWords("所有勋章属性提升") + meiyinNum + LanResManager.getLanCommonTextWords("倍，最多可使用500个美音迦南") + "<br>" + LanResManager.getLanCommonTextWords("当勋章形成“卐”字佛文，将获得勋章技能大日如来咒 —— 传闻为佛教至高无上心法，") + "<br>" + LanResManager.getLanCommonTextWords("大日如来咒当 在自身受到攻击时，都将有几率触发。瞬间将可清除自身所有负面状态。") + "<br>" + LanResManager.getLanCommonTextWords("并且触发时还将同时触发如来梵音使对手毫无战斗之力，暂停一切攻击。如来梵音效果") + "<br>" + LanResManager.getLanCommonTextWords("将持续8秒。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts1 = new FTextArea();
         this.fts1.x = 10 + 300 - 25;
         this.fts1.y = 7 + 20 + 20 + 20 + 277;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 120;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("烈焰玄冥（神兽）");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击 68888亿、防御60888亿、血量80888亿、所有武功提升 880000层") + "<br>" + LanResManager.getLanCommonTextWords("玄冥：北方冥间上古神兽，其混沌不分、深不可测，传闻见该神兽者见乎无一人生还。") + "<br>" + LanResManager.getLanCommonTextWords("阴阳烈焰：攻击时有几率触发阴阳烈焰，持续10秒；在此状态下，自身周围将施发烈焰阵，") + "<br>" + LanResManager.getLanCommonTextWords("且每攻击一个对手，都可将该对手拉至身旁眩晕，持续10秒；眩晕的对手受烈焰阵的影响") + "<br>" + LanResManager.getLanCommonTextWords("瞬间掉血60%，且在10秒期间内，烈焰每秒对对手灼烧，每灼烧对手一次，自身将获得一个") + "<br>" + LanResManager.getLanCommonTextWords("阴阳咒，当阴阳烈焰解除后，自身将获得阴阳咒效果，整个人化为空气瞬间消失在对手面前。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkZq = new FCheckBox();
         addChild(this.checkZq);
         this.checkZq.x = 10 + 70 + 300;
         this.checkZq.y = 7 + 20 + 20 + 20 + 277;
         this.checkZq.addEventListener(MouseEvent.CLICK,this.onCheckClick);
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkZq.selectState,81]));
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         if(this.tarenPd)
         {
            this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      private function onMouseTip1(param1:MouseEvent) : void
      {
         var _loc2_:String = param1.currentTarget.name;
         var _loc3_:int = Number(_loc2_);
         var _loc4_:DisplayObject = getChildByName(_loc2_);
         var _loc5_:String = "";
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               _loc4_.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip1);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc5_ += "<textformat leading=\'6\'>";
               switch(_loc3_)
               {
                  case 1:
                     _loc5_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("勇气系列徽章可以给自身带来额外的攻击力。") + "</font>";
                     break;
                  case 2:
                     _loc5_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("坚韧系列徽章可以给自身带来额外的防御力。") + "</font>";
                     break;
                  case 3:
                     _loc5_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("狂暴系列徽章可以给自身带来额外的暴击能力。") + "</font>";
                     break;
                  case 4:
                     _loc5_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("灵巧系列徽章可以给自身带来额外的闪避能力。") + "</font>";
                     break;
                  case 5:
                     _loc5_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("生命系列徽章可以给自身带来额外的生命力。") + "</font>";
               }
               _loc5_ += "</textformat>";
               this.showTip(_loc5_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               _loc4_.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip1);
         }
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = mouseX + 15;
         this.tipCanvas.y = mouseY + 25;
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this._parent = param1;
      }
      
      public function setShowItem(param1:Boolean, param2:Array) : void
      {
         var _loc3_:Bitmap = null;
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc8_:Goods = null;
         var _loc9_:ItemFace = null;
         var _loc10_:int = 0;
         var _loc11_:Boolean = false;
         while(this.equipContainer.numChildren > 0)
         {
            this.equipContainer.removeChildAt(0);
         }
         _loc4_ = 0;
         while(_loc4_ < OtherConst.xunzhangJieshu)
         {
            _loc10_ = 0;
            while(_loc10_ < 5)
            {
               _loc3_ = StaticValue.getBitmapByClassName("ui.char.xunzhang.kuang");
               _loc3_.x = 45 + 65 * _loc10_ - 3;
               _loc3_.y = _loc4_ * 55 - 3 + 10 - 4;
               this.equipContainer.addChild(_loc3_);
               _loc10_++;
            }
            _loc4_++;
         }
         var _loc5_:Array = param2;
         var _loc7_:int = int(param2.length);
         _loc6_ = 0;
         while(_loc6_ < _loc7_)
         {
            _loc8_ = param2[_loc6_] as Goods;
            if(!(_loc8_.res.position == ItemPositionRange.POSTION_BOW || _loc8_.res.position == ItemPositionRange.POSTION_ZHENHUN))
            {
               _loc9_ = new ItemFace(_loc8_);
               _loc11_ = false;
               _loc4_ = 0;
               while(_loc4_ < ItemPositionRange.POSITION_XUNZHANG_ARR.length)
               {
                  _loc10_ = 0;
                  while(_loc10_ < ItemPositionRange.POSITION_XUNZHANG_ARR[_loc4_].length)
                  {
                     if(_loc8_.res.position == ItemPositionRange.POSITION_XUNZHANG_ARR[_loc4_][_loc10_])
                     {
                        _loc9_.x = 45 + 65 * _loc10_;
                        _loc9_.y = _loc4_ * 55 + 10 - 4;
                        _loc11_ = true;
                     }
                     _loc10_++;
                  }
                  _loc4_++;
               }
               if(_loc11_)
               {
                  _loc9_.showRedMask();
                  _loc9_.showStrengthenLv = true;
                  _loc9_.name = String(_loc8_.res.position);
                  this.equipContainer.addChild(_loc9_);
               }
            }
            _loc6_++;
         }
         this.Scroll.update();
         this.setJiHuochixue(param1);
      }
      
      public function setJiHuochixue(param1:Boolean) : void
      {
         if(param1)
         {
            this.bg1.visible = GameState.dictMainStatus[SpecialGoodsID.XUNZHANG_DARIRULAIZHOUZHENJING_ID];
            this.meiyinNum = GameState.dictMainStatus[SpecialGoodsID.XUNZHANG_MEIYINJIANAN_ID];
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.XUNZHANG_LIEYANXUANMING_ID];
            this.checkZq.visible = GameState.dictMainStatus[SpecialGoodsID.XUNZHANG_LIEYANXUANMING_ID];
         }
         else
         {
            this.bg1.visible = GameState.dictTargetStatus[SpecialGoodsID.XUNZHANG_DARIRULAIZHOUZHENJING_ID];
            this.meiyinNum = GameState.dictTargetStatus[SpecialGoodsID.XUNZHANG_MEIYINJIANAN_ID];
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.XUNZHANG_LIEYANXUANMING_ID];
            this.checkZq.visible = GameState.dictTargetStatus[SpecialGoodsID.XUNZHANG_LIEYANXUANMING_ID];
         }
      }
      
      public function setEnabledFun() : void
      {
         this.tarenPd = false;
      }
      
      public function setTotalXunzhang(param1:Boolean, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int) : void
      {
         if(param1)
         {
            this.ft_b.visible = false;
            this.ft_b1.visible = false;
            this.fengmangFt.visible = true;
            this.fengmangNum.visible = true;
            this.xunzhangNum.visible = true;
            this.fengmangNum.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("基础属性：") + LanResManager.getLanCommonTextWords("攻击") + " " + param2 + " " + LanResManager.getLanCommonTextWords("防御") + " " + param3 + " " + LanResManager.getLanCommonTextWords("生命") + " " + param4 + " " + LanResManager.getLanCommonTextWords("暴击") + " " + param5 + " " + LanResManager.getLanCommonTextWords("闪避") + " " + param6 + "</font>";
            this.xunzhangNum.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("收集勋章数量：") + param7 + "       " + LanResManager.getLanCommonTextWords("王者翻倍：") + param8 + "</font>";
         }
         else
         {
            this.ft_b.visible = true;
            this.ft_b1.visible = true;
            this.fengmangFt.visible = false;
            this.fengmangNum.visible = false;
            this.xunzhangNum.visible = false;
         }
      }
      
      public function gouxuan(param1:Boolean) : void
      {
         this.checkZq.selectState = param1;
      }
   }
}

