package com.tgame.shell.view.components.attribute
{
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
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
   
   public class ZhanQi extends Sprite
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
      
      private var Song_bit:DisplayObject;
      
      private var fengmangNum:FTextArea;
      
      private var xunzhangNum:FTextArea;
      
      public var num:int = 0;
      
      private var bg1:DisplayObject;
      
      private var shenguoNum:int = 0;
      
      private var fts1:FTextArea;
      
      private var checkHuanZhuang:FCheckBox;
      
      public function ZhanQi()
      {
         super();
         this.fc1 = new FCanvas();
         this.fc1.x = 0;
         this.fc1.y = 0;
         this.fc1.width = 402;
         this.fc1.height = 365;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.Song_bit = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/zhanqixitong/zhanqi.jpg",398,299);
         this.Song_bit.x = 2;
         this.Song_bit.y = 2 + 1;
         addChild(this.Song_bit);
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
         this.ft1.x = 40;
         this.ft1.y = 10;
         this.ft1.name = "1";
         this.ft1.autoSize = TextFieldAutoSize.LEFT;
         this.ft1.textColor = StaticValue.GOLD;
         this.ft1.filters = StaticValue.filter;
         this.ft1.htmlText = "<textformat leading=\'6\'><font size=\'14\'>" + LanResManager.getLanCommonTextWords("赤金") + "</font></textformat>";
         addChild(this.ft1);
         this.ft1.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip1);
         this.ft1.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip1);
         this.ft2 = new FTextArea();
         this.ft2.x = 104;
         this.ft2.y = 10;
         this.ft2.name = "2";
         this.ft2.autoSize = TextFieldAutoSize.LEFT;
         this.ft2.textColor = StaticValue.GOLD;
         this.ft2.filters = StaticValue.filter;
         this.ft2.htmlText = "<textformat leading=\'6\'><font size=\'14\'>" + LanResManager.getLanCommonTextWords("厚土") + "</font></textformat>";
         addChild(this.ft2);
         this.ft2.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip1);
         this.ft2.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip1);
         this.ft3 = new FTextArea();
         this.ft3.x = 169;
         this.ft3.y = 10;
         this.ft3.name = "3";
         this.ft3.autoSize = TextFieldAutoSize.LEFT;
         this.ft3.textColor = StaticValue.GOLD;
         this.ft3.filters = StaticValue.filter;
         this.ft3.htmlText = "<textformat leading=\'6\'><font size=\'14\'>" + LanResManager.getLanCommonTextWords("紫炎") + "</font></textformat>";
         addChild(this.ft3);
         this.ft3.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip1);
         this.ft3.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip1);
         this.ft4 = new FTextArea();
         this.ft4.x = 223;
         this.ft4.y = 10;
         this.ft4.name = "4";
         this.ft4.autoSize = TextFieldAutoSize.LEFT;
         this.ft4.textColor = StaticValue.GOLD;
         this.ft4.filters = StaticValue.filter;
         this.ft4.htmlText = "<textformat leading=\'6\'><font size=\'14\'>" + LanResManager.getLanCommonTextWords("玄水") + "</font></textformat>";
         addChild(this.ft4);
         this.ft4.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip1);
         this.ft4.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip1);
         this.ft5 = new FTextArea();
         this.ft5.x = 296;
         this.ft5.y = 10;
         this.ft5.name = "5";
         this.ft5.autoSize = TextFieldAutoSize.LEFT;
         this.ft5.textColor = StaticValue.GOLD;
         this.ft5.filters = StaticValue.filter;
         this.ft5.htmlText = "<textformat leading=\'6\'><font size=\'14\'>" + LanResManager.getLanCommonTextWords("青木") + "</font></textformat>";
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
         this.ft_b.htmlText = LanResManager.getLanCommonTextWords("战旗系统说明：");
         addChild(this.ft_b);
         this.ft_b1 = new FTextArea();
         this.ft_b1.x = 10;
         this.ft_b1.y = 315;
         this.ft_b1.wordWrap = true;
         this.ft_b1.width = 385;
         this.ft_b1.textColor = StaticValue.SKY_BLUE;
         this.ft_b1.filters = StaticValue.filter;
         this.ft_b1.htmlText = LanResManager.getLanCommonTextWords("将不同的战旗镶嵌到对应的战旗栏中可以获得不同的属性加成。战旗共分五种：赤金、厚土、紫炎、玄水、青木。");
         addChild(this.ft_b1);
         this.fengmangNum = new FTextArea();
         this.fengmangNum.x = 10;
         this.fengmangNum.y = 300;
         this.fengmangNum.wordWrap = true;
         this.fengmangNum.width = 385;
         this.fengmangNum.autoSize = TextFieldAutoSize.LEFT;
         this.fengmangNum.filters = StaticValue.filter;
         this.fengmangNum.htmlText = "";
         addChild(this.fengmangNum);
         this.xunzhangNum = new FTextArea();
         this.xunzhangNum.x = 10;
         this.xunzhangNum.y = 330;
         this.xunzhangNum.autoSize = TextFieldAutoSize.LEFT;
         this.xunzhangNum.filters = StaticValue.filter;
         this.xunzhangNum.htmlText = "";
         addChild(this.xunzhangNum);
         this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/zhanqixitong/shizi.swf");
         this.bg1.x = 2 + 350 + 8;
         this.bg1.y = 2 + 16 + 21;
         addChild(this.bg1);
         ToolTips.createToolTips(this.bg1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("当期已使用") + shenguoNum + LanResManager.getLanCommonTextWords("颗修罗神果") + "<br>" + LanResManager.getLanCommonTextWords("所有战旗属性提升") + shenguoNum + LanResManager.getLanCommonTextWords("倍，最多可使用500颗修罗神果") + "<br>" + LanResManager.getLanCommonTextWords("当战旗形成“十”字天架，将获得战旗技能“十字仙境” —— 传闻阿修罗在人物之中发现的强大力量。") + "<br>" + LanResManager.getLanCommonTextWords("人物只需用内力以及自身性格锁铸造出来的强大气场都将可练就十字仙境，十字仙境每10次攻击，都必") + "<br>" + LanResManager.getLanCommonTextWords("定使对手触发此技能状态，在此技能状态下，可使对手瞬间降低30% 当前血量。累计命中3次 十字仙境") + "<br>" + LanResManager.getLanCommonTextWords("状态后。必定受到十字束缚，造成定身1分钟的无解效果。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts1 = new FTextArea();
         this.fts1.x = 10 + 300;
         this.fts1.y = 7 + 20 + 20 + 20 + 277;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 120;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("护国神将");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 500000层") + "<br>" + LanResManager.getLanCommonTextWords("护国神将：护国英雄，可附于身，玩家可自己召唤护国神将陪同战斗。") + "<br>" + LanResManager.getLanCommonTextWords("神将威慑：攻击时100%触发神将威慑，持续10秒；在此状态下，每秒可将5格范围内的") + "<br>" + LanResManager.getLanCommonTextWords("所有玩家都威慑瞬间击退定身于原地5秒；且自身每攻击对手一次，对手都将瞬间在次") + "<br>" + LanResManager.getLanCommonTextWords("被击退定身5秒，且受到威慑的玩家，无法触发任何勋章效果。冷却60秒。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkHuanZhuang = new FCheckBox();
         addChild(this.checkHuanZhuang);
         this.checkHuanZhuang.x = 10 + 70 + 300;
         this.checkHuanZhuang.y = 7 + 20 + 20 + 20 + 277;
         this.checkHuanZhuang.addEventListener(MouseEvent.CLICK,this.onCheckClick);
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkHuanZhuang.selectState,59]));
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
                     _loc5_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("赤金：赤金战旗可以给自身带来额外的攻击力。") + "</font>";
                     break;
                  case 2:
                     _loc5_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("厚土：厚土战旗可以给自身带来额外的防御力。") + "</font>";
                     break;
                  case 3:
                     _loc5_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("紫炎：紫炎战旗可以给自身带来额外的暴击能力。") + "</font>";
                     break;
                  case 4:
                     _loc5_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("玄水：玄水战旗可以给自身带来额外的闪避能力。") + "</font>";
                     break;
                  case 5:
                     _loc5_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("青木：青木战旗可以给自身带来额外的生命力。") + "</font>";
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
         this.num = 0;
         while(this.equipContainer.numChildren > 0)
         {
            this.equipContainer.removeChildAt(0);
         }
         _loc4_ = 0;
         while(_loc4_ < OtherConst.zhanqiJieshu)
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
               while(_loc4_ < ItemPositionRange.POSITION_ZHANQI_ARR.length)
               {
                  _loc10_ = 0;
                  while(_loc10_ < ItemPositionRange.POSITION_ZHANQI_ARR[_loc4_].length)
                  {
                     if(_loc8_.res.position == ItemPositionRange.POSITION_ZHANQI_ARR[_loc4_][_loc10_])
                     {
                        ++this.num;
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
            this.bg1.visible = GameState.dictMainStatus[SpecialGoodsID.ZHANQI_SHIZIXIANJINGMIJI_ID];
            this.shenguoNum = GameState.dictMainStatus[SpecialGoodsID.ZHANQI_XIULUOSHENGUO_ID];
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.ZHANQI_HUGUOSHENJIANG_ID];
            this.checkHuanZhuang.visible = GameState.dictMainStatus[SpecialGoodsID.ZHANQI_HUGUOSHENJIANG_ID];
         }
         else
         {
            this.bg1.visible = GameState.dictTargetStatus[SpecialGoodsID.ZHANQI_SHIZIXIANJINGMIJI_ID];
            this.shenguoNum = GameState.dictTargetStatus[SpecialGoodsID.ZHANQI_XIULUOSHENGUO_ID];
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.ZHANQI_HUGUOSHENJIANG_ID];
            this.checkHuanZhuang.visible = GameState.dictTargetStatus[SpecialGoodsID.ZHANQI_HUGUOSHENJIANG_ID];
         }
      }
      
      public function setEnabledFun() : void
      {
         this.tarenPd = false;
      }
      
      public function setTotal(param1:Boolean) : void
      {
         if(param1)
         {
            this.ft_b.visible = false;
            this.ft_b1.visible = false;
            this.fengmangNum.visible = true;
            this.xunzhangNum.visible = true;
            this.fengmangNum.htmlText = "<font size=\'12\' color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("战旗大阵属性：攻击2888888、防御 2288888、血量188888888、提升人物攻击10%、防御20%、血量30%") + "</font>";
            this.xunzhangNum.htmlText = "<font size=\'12\' color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("十月围城战旗阵特殊效果：每佩戴一面战旗都将获得58888888血量加成") + "<br>" + LanResManager.getLanCommonTextWords("（最高提升25倍）（已佩戴") + this.num + LanResManager.getLanCommonTextWords("面战旗）") + "</font>";
         }
         else
         {
            this.ft_b.visible = true;
            this.ft_b1.visible = true;
            this.fengmangNum.visible = false;
            this.xunzhangNum.visible = false;
         }
      }
      
      public function ishuanz(param1:Boolean) : void
      {
         this.checkHuanZhuang.selectState = param1;
      }
   }
}

