package com.tgame.shell.view.components.yuanwu
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.movie.BitmapMovie;
   import com.fireice.util.Tools;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ColorBar;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.TimeManager;
   import com.tgame.shell.view.components.systemculture.TipCanvas;
   import com.tgame.shell.view.components.utils.TipManager;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   import game.display.Container;
   import game.display.Image;
   import game.display.Label;
   import game.display.RadioButton;
   import game.display.SimpleButton;
   import game.skin.YuanWuSkin;
   import game.utils.SkinTools;
   
   public class YuanwuHeXinPanel extends BasePanel
   {
      
      public static const AutoBuy:String = "_yuanwuhexinAutoBuy";
      
      public static const TISHENG:String = "_yuanwuhexinTisheng";
      
      public static const Jinjie:String = "_yuanwuhexinJinjie";
      
      public static const AutoJinjie:String = "_yuanwuhexinAutoJinjie";
      
      public static const AutoTisheng:String = "_yuanwuhexinAutoTisheng";
      
      private var goodCount:int;
      
      private var goodID:int;
      
      private var color:ColorBar;
      
      private var guanbi:SimpleButton;
      
      private var item:ItemFace;
      
      private var lv_L_1:Image;
      
      private var lv_L_2:Image;
      
      private var lv_L_3:Image;
      
      private var lv_L_4:Image;
      
      private var lv_L_5:Image;
      
      private var lv_L_6:Image;
      
      private var lv_L_7:Image;
      
      private var lv_L_8:Image;
      
      private var lv_L_9:Image;
      
      private var lv_L_10:Image;
      
      private var lv_R_1:Image;
      
      private var lv_R_2:Image;
      
      private var lv_R_3:Image;
      
      private var lv_R_4:Image;
      
      private var lv_R_5:Image;
      
      private var lv_R_6:Image;
      
      private var lv_R_7:Image;
      
      private var lv_R_8:Image;
      
      private var lv_R_9:Image;
      
      private var lv_R_10:Image;
      
      private var cishuImg:Image;
      
      private var tupozhong:Image;
      
      private var _container:Container;
      
      private var _isPlayer:Boolean;
      
      private var tishengBtn:SimpleButton;
      
      private var autotishengBtn:SimpleButton;
      
      private var tupoBtn:SimpleButton;
      
      private var autoTupoBtn:SimpleButton;
      
      private var goumai:SimpleButton;
      
      private var wenhao:SimpleButton;
      
      private var checkBtn:RadioButton;
      
      private var type:int = 1;
      
      private var zuoZongshuxing:Label;
      
      private var youZongshuxing:Label;
      
      private var xingyunTime:Label;
      
      private var chenggongLv:Label;
      
      private var hexinLv:Label;
      
      private var _luckTime:int;
      
      private var _functionId:int;
      
      private var yuanhuaMovie:BitmapMovie;
      
      private var hexinNameArr:Array = ["","月光核心","幽冥核心","八荒核心","凶魔核心","雷烈核心","幻空核心","灭地核心","蟠龙核心","龙纹核心","龙牙核心","翠玉核心","奇羽核心","冰轮核心","散魂核心","伏魔核心","月光核心","夜影核心","星月核心","戮神核心","六道核心","黄龙核心","暗灵核心","冥域核心"];
      
      private var nameArr:Array = ["攻击：","防御：","生命：","暴击：","闪避：","暴伤：","暴抗：","威压："];
      
      private var boxContainer:Sprite;
      
      private var goods:Goods;
      
      public function YuanwuHeXinPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(YuanWuSkin.skin,"yuanwuhexin");
         this.boxContainer = new Sprite();
         this.boxContainer.mouseEnabled = false;
         this.boxContainer.mouseChildren = false;
         addChild(this.boxContainer);
      }
      
      override protected function createVariableReference() : void
      {
         var i:*;
         var str:String = null;
         var tipCanvas:TipCanvas = null;
         this.color = new ColorBar(5,210,9,true);
         this.color.x = 495;
         this.color.y = 304;
         addChild(this.color);
         this.tishengBtn = getChildByName("djtishengan") as SimpleButton;
         this.autotishengBtn = getChildByName("zdtishengan") as SimpleButton;
         this.tupoBtn = getChildByName("djtupoan") as SimpleButton;
         this.autoTupoBtn = getChildByName("zdtupoan") as SimpleButton;
         this.goumai = getChildByName("goumaian") as SimpleButton;
         this.tishengBtn.addEventListener(MouseEvent.CLICK,this.clickHandler);
         this.autotishengBtn.addEventListener(MouseEvent.CLICK,this.clickHandler);
         this.tupoBtn.addEventListener(MouseEvent.CLICK,this.clickHandler);
         this.autoTupoBtn.addEventListener(MouseEvent.CLICK,this.clickHandler);
         this.goumai.addEventListener(MouseEvent.CLICK,this.clickHandler);
         this.goumai.visible = false;
         this.guanbi = getChildByName("guanbi") as SimpleButton;
         this.guanbi.addEventListener(MouseEvent.CLICK,this.onClose);
         this.checkBtn = getChildByName("duigou1") as RadioButton;
         this.checkBtn.addEventListener(MouseEvent.CLICK,this.clickHandler);
         this.hexinLv = getChildByName("hexindengji") as Label;
         this.hexinLv.text = "";
         this.zuoZongshuxing = getChildByName("zuocewznr") as Label;
         this.zuoZongshuxing.text = "";
         this.youZongshuxing = getChildByName("youcewznr") as Label;
         this.youZongshuxing.text = "";
         this.chenggongLv = getChildByName("wanzi3") as Label;
         this.chenggongLv.text = "";
         this.xingyunTime = getChildByName("wanzi4") as Label;
         this.xingyunTime.text = "";
         this.lv_L_1 = getChildByName("HXdj1a") as Image;
         this.lv_L_2 = getChildByName("HXdj2a") as Image;
         this.lv_L_3 = getChildByName("HXdj3a") as Image;
         this.lv_L_4 = getChildByName("HXdj4a") as Image;
         this.lv_L_5 = getChildByName("HXdj5a") as Image;
         this.lv_L_6 = getChildByName("HXdj6a") as Image;
         this.lv_L_7 = getChildByName("HXdj7a") as Image;
         this.lv_L_8 = getChildByName("HXdj8a") as Image;
         this.lv_L_9 = getChildByName("HXdj9a") as Image;
         this.lv_L_10 = getChildByName("HXdj10a") as Image;
         this.lv_R_1 = getChildByName("ji1") as Image;
         this.lv_R_2 = getChildByName("ji2") as Image;
         this.lv_R_3 = getChildByName("ji3") as Image;
         this.lv_R_4 = getChildByName("ji4") as Image;
         this.lv_R_5 = getChildByName("ji5") as Image;
         this.lv_R_6 = getChildByName("ji6") as Image;
         this.lv_R_7 = getChildByName("ji7") as Image;
         this.lv_R_8 = getChildByName("ji8") as Image;
         this.lv_R_9 = getChildByName("ji9") as Image;
         this.lv_R_10 = getChildByName("ji10") as Image;
         this.cishuImg = getChildByName("tishengzhong") as Image;
         this.tupozhong = getChildByName("tupozhong") as Image;
         i = 1;
         while(i <= 10)
         {
            this["lv_R_" + String(i)].visible = false;
            this["lv_L_" + String(i)].visible = false;
            i++;
         }
         this._container = new Container();
         addChild(this._container);
         this.wenhao = getChildByName("wenhaotubiao3") as SimpleButton;
         str = "1.核心升级共有2个阶段，提升阶段和突破阶段。当提升值达到满值以后，会进入突破阶段。突破成功则元武等级提升。" + "\n" + "2.元武核心每提升一次会给予少量属性加成，每突破成功一次会给予大量属性加成。" + "\n" + "3.核心等级越高，元武技能的等级越高。";
         tipCanvas = new TipCanvas(str,200);
         TipManager.regObj2HasTips(this.wenhao,null,false,function(param1:DisplayObject):TipCanvas
         {
            tipCanvas.htmlText = str;
            return tipCanvas;
         });
      }
      
      override public function onClose(param1:* = null) : void
      {
         super.onClose();
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function clickHandler(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.tishengBtn:
               if(this.tishengBtn.enabled)
               {
                  dispatchEvent(new BaseEvent(TISHENG,"",this.type));
               }
               break;
            case this.autotishengBtn:
               if(this.autotishengBtn.enabled)
               {
                  dispatchEvent(new BaseEvent(AutoTisheng,"",this.type));
               }
               break;
            case this.tupoBtn:
               dispatchEvent(new BaseEvent(Jinjie,"",this.type));
               break;
            case this.autoTupoBtn:
               dispatchEvent(new BaseEvent(AutoJinjie,"",this.type));
               break;
            case this.checkBtn:
               dispatchEvent(new BaseEvent(AutoBuy,"",this.checkBtn.selected));
               break;
            case this.goumai:
               PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[this.item.getBaseItem().id,0]);
         }
      }
      
      public function setData(param1:Object) : void
      {
         this.type = param1.type;
         this.zuoZongshuxing.text = "";
         this.youZongshuxing.text = "";
         this.hexinLv.text = this.hexinLvFunc(param1.lv);
         var _loc2_:int = 1;
         while(_loc2_ <= 10)
         {
            this["lv_R_" + String(_loc2_)].visible = false;
            this["lv_L_" + String(_loc2_)].visible = false;
            _loc2_++;
         }
         _loc2_ = 1;
         while(_loc2_ <= param1.lv)
         {
            if(_loc2_ == param1.lv)
            {
               this["lv_R_" + String(_loc2_)].visible = true;
            }
            this["lv_L_" + String(_loc2_)].visible = true;
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < param1.arr.length)
         {
            if(_loc2_ < 4)
            {
               this.zuoZongshuxing.text += this.nameArr[_loc2_] + param1.arr[_loc2_] + "\n";
            }
            else
            {
               this.youZongshuxing.text += this.nameArr[_loc2_] + param1.arr[_loc2_] + "\n";
            }
            _loc2_++;
         }
         if(param1.lv >= 10)
         {
            this.tishengBtn.enabled = this.autotishengBtn.enabled = false;
         }
         else
         {
            this.tishengBtn.enabled = this.autotishengBtn.enabled = true;
         }
         this.uiInit();
      }
      
      private function hexinLvFunc(param1:int) : String
      {
         return this.hexinNameArr[this.type] + "[" + param1 + "级]";
      }
      
      private function uiInit() : void
      {
         var arrPoint:Array;
         this.removeContainerBoxChildren();
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            boxContainer.addChild(_loc2_.content as MovieClip);
         },null,false,GameConfig.fileBaseFolder + "res/ui/UIditu/yuanwu/effect/2/" + this.type + ".swf");
         arrPoint = [new Point(0,0),new Point(112,93),new Point(75,16),new Point(43,16),new Point(62,57),new Point(23,47),new Point(21,63),new Point(21,63),new Point(95,95),new Point(95,95),new Point(73,63),new Point(68,78),new Point(68,78),new Point(68,78),new Point(68,78),new Point(68,78),new Point(68,78),new Point(68,78),new Point(68,78),new Point(68,78),new Point(68,78),new Point(68,78),new Point(68,78),new Point(68,78)];
         this.boxContainer.x = arrPoint[this.type].x;
         this.boxContainer.y = arrPoint[this.type].y;
      }
      
      public function setDataInfo(param1:Object) : void
      {
         if(Boolean(this.item) && Boolean(this.item.parent))
         {
            this.item.parent.removeChild(this.item);
         }
         this.type = param1.type;
         if(param1.isTupo)
         {
            this.tishengBtn.visible = false;
            this.autotishengBtn.visible = false;
            this.cishuImg.visible = false;
            this.tupoBtn.visible = true;
            this.autoTupoBtn.visible = true;
            this.chenggongLv.visible = true;
            this.xingyunTime.visible = true;
            this.tupozhong.visible = true;
            this.goodID = param1.goods;
            this.goodCount = param1.count;
            this.goods = new Goods(this.goodID);
            this.goods.count = this.goodCount;
            this.item = new ItemFace(this.goods);
            addChild(this.item);
            this.chenggongLv.text = "成功率:" + param1.chenggonglv / 100 + "%";
            this.color.setValue(param1.cur,param1.max);
            this.luckTime(param1.time);
         }
         else
         {
            this.autotishengBtn.visible = true;
            this.tishengBtn.visible = true;
            this.cishuImg.visible = true;
            this.tupoBtn.visible = false;
            this.autoTupoBtn.visible = false;
            this.chenggongLv.visible = false;
            this.xingyunTime.visible = false;
            this.tupozhong.visible = false;
            this.goodID = param1.goods;
            this.goodCount = param1.count;
            this.goods = new Goods(this.goodID);
            this.goods.count = this.goodCount;
            this.item = new ItemFace(this.goods);
            addChild(this.item);
            this.color.setValue(param1.curCor,param1.maxCor);
         }
         this.item.x = 421;
         this.item.y = 291;
         this.refuseGood();
      }
      
      private function onRemove() : void
      {
         clearInterval(this._functionId);
      }
      
      public function luckTime(param1:int) : void
      {
         this.onRemove();
         this._luckTime = param1 / 1000;
         this._functionId = setInterval(this.onTime,1000);
         this.onTime();
      }
      
      private function onTime() : void
      {
         --this._luckTime;
         this._luckTime = Math.max(0,this._luckTime);
         var _loc1_:String = TimeManager.millisecond2Str2(this._luckTime * 1000);
         this.xingyunTime.text = LanResManager.getLanCommonTextWords("幸运值剩余时间") + " " + _loc1_;
         if(!this._luckTime)
         {
            this.onRemove();
         }
      }
      
      public function refuseGood() : void
      {
         var _loc1_:int = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(this.goodID,true);
         if(this.item)
         {
            if(_loc1_ < this.goodCount)
            {
               this.item.filters = Tools.blackWhiteFilter;
            }
            else
            {
               this.item.filters = [];
            }
         }
      }
      
      private function removeContainerBoxChildren() : void
      {
         while(this.boxContainer.numChildren > 0)
         {
            this.boxContainer.removeChildAt(0);
         }
      }
   }
}

