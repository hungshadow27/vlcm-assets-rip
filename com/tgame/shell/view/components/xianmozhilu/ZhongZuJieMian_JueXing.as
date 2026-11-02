package com.tgame.shell.view.components.xianmozhilu
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.NewSkinButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class ZhongZuJieMian_JueXing extends Sprite
   {
      
      public var _parent:DisplayObject;
      
      private var boxContainer:Sprite;
      
      private var gongji:FLabel;
      
      private var fangyu:FLabel;
      
      private var shengming:FLabel;
      
      private var shuXing:FLabel;
      
      private var xiaohao:FLabel;
      
      private var beibao:FLabel;
      
      private var txtTip:FLabel;
      
      private var btnShengJie:NewSkinButton;
      
      private var txtXianMoJueXingJi:FTextArea;
      
      private var txt1:FTextArea;
      
      private var txt2:FTextArea;
      
      private var txt3:FTextArea;
      
      private var txt4:FTextArea;
      
      private var txt5:FTextArea;
      
      private var txt6:FTextArea;
      
      private var txt6Num:int;
      
      private var arrStar:Array;
      
      private var arrStar2:Array;
      
      private var heroHeadMC:MovieClip;
      
      private var heroEffectMC:MovieClip;
      
      private var equipContainers:Sprite;
      
      private var kuangHD:Bitmap;
      
      public function ZhongZuJieMian_JueXing()
      {
         var bg:DisplayObject;
         super();
         bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/xianmozhilu/juexing/bg.swf");
         bg.x = 10;
         bg.y = 22;
         addChild(bg);
         this.boxContainer = new Sprite();
         addChild(this.boxContainer);
         this.initStar();
         this.gongji = new FLabel();
         this.gongji.textColor = StaticValue.YELLOW;
         this.gongji.filters = StaticValue.filter;
         this.gongji.x = 290;
         this.gongji.y = 190;
         addChild(this.gongji);
         this.fangyu = new FLabel();
         this.fangyu.textColor = StaticValue.YELLOW;
         this.fangyu.filters = StaticValue.filter;
         this.fangyu.x = 290;
         this.fangyu.y = 210;
         addChild(this.fangyu);
         this.shengming = new FLabel();
         this.shengming.textColor = StaticValue.YELLOW;
         this.shengming.filters = StaticValue.filter;
         this.shengming.x = 290;
         this.shengming.y = 230;
         addChild(this.shengming);
         this.shuXing = new FLabel();
         this.shuXing.textColor = StaticValue.YELLOW;
         this.shuXing.filters = StaticValue.filter;
         this.shuXing.x = 290;
         this.shuXing.y = 250;
         addChild(this.shuXing);
         this.xiaohao = new FLabel();
         this.xiaohao.textColor = StaticValue.YELLOW;
         this.xiaohao.filters = StaticValue.filter;
         this.xiaohao.x = 80;
         this.xiaohao.y = 315;
         addChild(this.xiaohao);
         this.beibao = new FLabel();
         this.beibao.textColor = StaticValue.YELLOW;
         this.beibao.filters = StaticValue.filter;
         this.beibao.x = 80;
         this.beibao.y = 335;
         addChild(this.beibao);
         this.txtTip = new FLabel();
         this.txtTip.textColor = StaticValue.GREEN;
         this.txtTip.filters = StaticValue.filter;
         this.txtTip.text = "天灵获得途径";
         this.txtTip.x = 300;
         this.txtTip.y = 330;
         addChild(this.txtTip);
         ToolTips.createToolTips(this.txtTip,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "玩家可通过每日充值" + "<br>" + "或运营活动获得天灵" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.equipContainers = new Sprite();
         addChild(this.equipContainers);
         this.equipContainers.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick00,false,30);
         this.btnShengJie = new NewSkinButton();
         this.btnShengJie.skin = "xianmojuexing_Button";
         this.btnShengJie.x = 70;
         this.btnShengJie.y = 350;
         addChild(this.btnShengJie);
         this.btnShengJie.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.txtXianMoJueXingJi = new FTextArea();
         this.txtXianMoJueXingJi.x = 30;
         this.txtXianMoJueXingJi.y = 45;
         this.txtXianMoJueXingJi.textColor = StaticValue.GREEN;
         this.txtXianMoJueXingJi.width = 70;
         this.txtXianMoJueXingJi.height = 20;
         this.txtXianMoJueXingJi.htmlText = "仙魔觉醒技";
         this.txtXianMoJueXingJi.visible = false;
         addChild(this.txtXianMoJueXingJi);
         ToolTips.createToolTips(this.txtXianMoJueXingJi,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊效果：仙魔满级时自身觉醒属性获得翻倍效果；" + "<br>" + "特殊技能：战斗状态下100%反噬对手一个仙魔觉醒技，对手每次操作都将会掉落1%当前血" + "<br>" + "量，且在此期间内无法恢复血量，持续15秒，冷却90秒。" + "（对仙魔转生及非转生均有效！）" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt1 = new FTextArea();
         this.txt1.x = 30;
         this.txt1.y = 63;
         this.txt1.textColor = StaticValue.GREEN;
         this.txt1.width = 90;
         this.txt1.height = 20;
         this.txt1.htmlText = "觉醒•凡";
         this.txt1.visible = false;
         addChild(this.txt1);
         ToolTips.createToolTips(this.txt1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "觉醒•凡：可增加攻击属性100%属性。" + "<br>" + "特殊属性：攻击400888亿、防御320888亿、血量320888亿、所有武功提升400000层" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt2 = new FTextArea();
         this.txt2.x = 30;
         this.txt2.y = 81;
         this.txt2.textColor = StaticValue.GREEN;
         this.txt2.width = 90;
         this.txt2.height = 20;
         this.txt2.htmlText = "觉醒•修";
         this.txt2.visible = false;
         addChild(this.txt2);
         ToolTips.createToolTips(this.txt2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "觉醒•修：可增加防御属性100%属性。" + "<br>" + "特殊属性：攻击400888亿、防御320888亿、血量320888亿、所有武功提升400000层" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt3 = new FTextArea();
         this.txt3.x = 30;
         this.txt3.y = 99;
         this.txt3.textColor = StaticValue.GREEN;
         this.txt3.width = 90;
         this.txt3.height = 20;
         this.txt3.htmlText = "觉醒•神";
         this.txt3.visible = false;
         addChild(this.txt3);
         ToolTips.createToolTips(this.txt3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "觉醒•神：可增加闪避属性100%属性。" + "<br>" + "特殊属性：攻击400888亿、防御320888亿、血量320888亿、所有武功提升400000层" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt4 = new FTextArea();
         this.txt4.x = 30;
         this.txt4.y = 117;
         this.txt4.textColor = StaticValue.GREEN;
         this.txt4.width = 90;
         this.txt4.height = 20;
         this.txt4.htmlText = "觉醒•仙";
         this.txt4.visible = false;
         addChild(this.txt4);
         ToolTips.createToolTips(this.txt4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "觉醒•仙：可增加暴击属性100%属性。" + "<br>" + "特殊属性：攻击400888亿、防御320888亿、血量320888亿、所有武功提升400000层" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt5 = new FTextArea();
         this.txt5.x = 30;
         this.txt5.y = 135;
         this.txt5.textColor = StaticValue.GREEN;
         this.txt5.width = 90;
         this.txt5.height = 20;
         this.txt5.htmlText = "觉醒•圣";
         this.txt5.visible = false;
         addChild(this.txt5);
         ToolTips.createToolTips(this.txt5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "觉醒•圣：可增加生命属性100%属性。" + "<br>" + "特殊属性：攻击400888亿、防御320888亿、血量320888亿、所有武功提升400000层" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.txt6 = new FTextArea();
         this.txt6.x = 30;
         this.txt6.y = 153;
         this.txt6.textColor = StaticValue.GREEN;
         this.txt6.width = 90;
         this.txt6.height = 20;
         this.txt6.htmlText = "传国玉玺碎片";
         this.txt6.visible = false;
         addChild(this.txt6);
         ToolTips.createToolTips(this.txt6,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "已使用：" + txt6Num + "<br>" + "特殊属性：双击使用可增加人物内功攻击：1000，内功防御：1000，内功值：1000，内功修为值：1000（限9次）" + "<br>" + "特殊效果：集齐传国玉玺碎片x9可激活传国玉玺，使自身进入战斗时瞬间受到传国玉玺保护，致使自身受" + "<br>" + "到金光环绕，无法被任何目标攻击，且使对手受到传国玉玺镇压，无法进行任何的操作30秒，冷却10秒。" + "<br>";
            return _loc1_ + "</textformat>";
         });
      }
      
      private function onItemClick00(param1:MouseEvent) : void
      {
         this._parent.dispatchEvent(new BaseEvent(ZhongZuJieMianPanel.UI_ZHONGZUJIEMIAN_MENU_SHOW,"",param1));
      }
      
      private function onClickHandler(param1:MouseEvent) : void
      {
         this._parent.dispatchEvent(new Event(ZhongZuJieMianPanel.UI_XIANMOJUEXING_SHENGJIE));
      }
      
      private function initStar() : void
      {
         var i:int = 0;
         var down:DisplayObject = null;
         var up:DisplayObject = null;
         var spr:Sprite = null;
         var obj:Object = null;
         this.arrStar = new Array();
         i = 0;
         while(i < 12)
         {
            down = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/xianmozhilu/juexing/an.swf");
            down.x = i * 21 + 20;
            down.y = 290;
            addChild(down);
            up = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/xianmozhilu/juexing/liang.swf");
            up.x = down.x;
            up.y = down.y;
            addChild(up);
            this.arrStar.push(up);
            i++;
         }
         this.arrStar2 = new Array();
         i = 0;
         while(i < 10)
         {
            spr = new Sprite();
            addChild(spr);
            spr.x = i * 25 - 9;
            spr.y = 230;
            this.arrStar2.push(spr);
            obj = new Object();
            obj.id = i;
            obj.spr = spr;
            LoadSwf.AndReturnMC2(GameConfig.fileBaseFolder + "res/ui/UIditu/chixuemozhen/tag.swf",function(param1:MovieClip, param2:Object):*
            {
               var _loc3_:Sprite = null;
               if(param1)
               {
                  _loc3_ = new Sprite();
                  _loc3_.addChild(param1);
                  _loc3_.name = String(param2.id);
                  param2.spr.addChild(_loc3_);
               }
            },obj);
            i++;
         }
      }
      
      public function setXianMoJueXingData(param1:Object) : void
      {
         var bgRank2:DisplayObject;
         var i:int = 0;
         var numNiTian:int = 0;
         var data:Object = param1;
         this.removeItemBoxChildren();
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            heroHeadMC = _loc2_.content as MovieClip;
            heroHeadMC.x = 30;
            heroHeadMC.y = 50;
            boxContainer.addChild(heroHeadMC);
         },null,false,GameConfig.fileBaseFolder + "res/ui/xianmozhilu/juexing/" + data.rank + ".swf");
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            heroEffectMC = _loc2_.content as MovieClip;
            heroEffectMC.x = 30;
            heroEffectMC.y = 45;
            boxContainer.addChild(heroEffectMC);
         },null,false,GameConfig.fileBaseFolder + "res/ui/xianmozhilu/juexing/huoquan.swf");
         bgRank2 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/xianmozhilu/juexing/star_" + data.rank + ".swf");
         bgRank2.x = 330;
         bgRank2.y = 100;
         this.boxContainer.addChild(bgRank2);
         i = 0;
         while(i < 12)
         {
            if(i < data.star)
            {
               this.arrStar[i].visible = true;
            }
            else
            {
               this.arrStar[i].visible = false;
            }
            i++;
         }
         this.gongji.text = "攻击：" + data.gongji + "亿";
         this.fangyu.text = "防御：" + data.fangyu + "亿";
         this.shengming.text = "生命：" + data.shengming + "亿";
         this.shuXing.text = "属性：+" + data.shuXing * 100 + "%";
         this.xiaohao.text = "消耗天灵：" + data.xiaohao + "";
         this.setGoodsChangeHandler();
         this.txtXianMoJueXingJi.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_XIANMOJUEXINGJI];
         this.txt1.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_XIANMOJUEXINGFAN];
         this.txt2.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_XIANMOJUEXINGXIU];
         this.txt3.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_XIANMOJUEXINGSHEN];
         this.txt4.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_XIANMOJUEXINGXIAN];
         this.txt5.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_XIANMOJUEXINGSHENG];
         this.txt6.visible = GameState.dictMainStatus[SpecialGoodsID.XIANMO_KANGNAIXINHUASHU_395867];
         this.txt6Num = GameState.dictMainStatus[SpecialGoodsID.XIANMO_KANGNAIXINHUASHU_395867];
         i = 0;
         while(i < this.arrStar2.length)
         {
            numNiTian = Math.floor(GameState.dictMainStatus[SpecialGoodsID.XIANMO_XIANMOJUEXINGNITIAN] / 100);
            if(i < numNiTian)
            {
               this.arrStar2[i].visible = true;
            }
            else
            {
               this.arrStar2[i].visible = false;
            }
            i++;
         }
         this.setInit();
      }
      
      public function setInit() : void
      {
         var _loc2_:int = 0;
         var _loc1_:Array = [];
         for each(_loc2_ in ItemPositionRange.POSTION_XIANMOJUEXING_SHENQI)
         {
            if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[_loc2_] != undefined)
            {
               _loc1_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[_loc2_]);
            }
         }
         this.set_ZhongZuJieMian(_loc1_);
      }
      
      public function set_ZhongZuJieMian(param1:Array) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         this.removeItemBoxChildren1();
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_] as Goods;
            _loc4_ = new ItemFace(_loc3_);
            if(_loc3_.res.position == ItemPositionRange.POSTION_XIANMOJUEXING_SHENQI[0])
            {
               this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.equipContainers.addChild(this.kuangHD);
               _loc4_.x = 220;
               _loc4_.y = 45;
               this.kuangHD.x = _loc4_.x - 2;
               this.kuangHD.y = _loc4_.y - 2;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_XIANMOJUEXING_SHENQI[1])
            {
               this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.equipContainers.addChild(this.kuangHD);
               _loc4_.x = 220;
               _loc4_.y = 45 + 40;
               this.kuangHD.x = _loc4_.x - 2;
               this.kuangHD.y = _loc4_.y - 2;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_XIANMOJUEXING_SHENQI[2])
            {
               this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.equipContainers.addChild(this.kuangHD);
               _loc4_.x = 220;
               _loc4_.y = 45 + 80;
               this.kuangHD.x = _loc4_.x - 2;
               this.kuangHD.y = _loc4_.y - 2;
               this.equipContainers.addChild(_loc4_);
            }
            _loc2_++;
         }
      }
      
      private function removeItemBoxChildren1() : void
      {
         while(this.equipContainers.numChildren > 0)
         {
            this.equipContainers.removeChildAt(0);
         }
      }
      
      public function setGoodsChangeHandler() : void
      {
         this.beibao.text = "拥有天灵：" + String(GameInstance.mainCharData.goodsInfo.getGoodsNumByID(47256,true));
      }
      
      private function removeItemBoxChildren() : void
      {
         while(this.boxContainer.numChildren > 0)
         {
            this.boxContainer.removeChildAt(0);
         }
      }
   }
}

