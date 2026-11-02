package com.tgame.shell.view.components.zhenbaoge
{
   import com.tgame.common.ui.componets.BasePanel;
   import flash.events.MouseEvent;
   import game.display.Container;
   import game.display.Label;
   import game.display.List;
   import game.display.ScrollBar;
   import game.display.SimpleButton;
   import game.skin.ZhenBaoGeSkin;
   import game.utils.SkinTools;
   
   public class YN2016ZhenbaogePanel extends BasePanel
   {
      
      public static const ZHENBAOGEGOUMAI:String = "ZHENBAOGEGOUMAI";
      
      private var guanbi:SimpleButton;
      
      private var _container:Container;
      
      private var list:List;
      
      private var scroll:ScrollBar;
      
      private var jifenTxT:Label;
      
      public function YN2016ZhenbaogePanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(ZhenBaoGeSkin.skin,"zhenbaoge");
      }
      
      override protected function createVariableReference() : void
      {
         this._container = new Container();
         addChild(this._container);
         this._container.x = -148;
         this._container.y = 81;
         this.guanbi = getChildByName("YBZLGBAN") as SimpleButton;
         this.guanbi.addEventListener(MouseEvent.CLICK,onClose);
         this.jifenTxT = getChildByName("webben3") as Label;
         this.list = getChildByName("liebiao") as List;
         this.list.ItemClass = listSRender;
         this.list.columnCount = 4;
         this.scroll = getChildByName("huatiao") as ScrollBar;
         this.scroll.target = this.list;
      }
      
      public function setData(param1:String, param2:int, param3:Array) : void
      {
         this.jifenTxT.text = param2 + "";
         this.list.DataSource = param3;
         this.scroll.update();
      }
   }
}

import br.com.stimuli.loading.loadingtypes.LoadingItem;
import com.tgame.common.GameConfig;
import com.tgame.common.GameInstance;
import com.tgame.common.res.lan.LanResManager;
import com.tgame.common.ui.componets.ItemFace;
import com.tgame.common.utils.LoadSwf;
import com.tgame.common.vo.item.Goods;
import com.zcp.common.events.BaseEvent;
import com.zcp.manager.LoaderManager;
import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import game.display.Image;
import game.display.Label;
import game.display.ListItemRender;
import game.display.SimpleButton;

class listSRender extends ListItemRender
{
   
   public static var $parent:DisplayObject;
   
   private var item:ItemFace;
   
   private var btn:SimpleButton;
   
   private var txtName:Label;
   
   private var txtPrice:Label;
   
   private var itemAry:Array;
   
   public function listSRender()
   {
      super();
      var _loc1_:int = 0;
      while(_loc1_ < 10)
      {
         this.itemAry = new Array(new Image());
         _loc1_++;
      }
   }
   
   protected function onClick(param1:MouseEvent) : void
   {
      GameInstance.uiInstance.ynzhenbaogePanel.dispatchEvent(new BaseEvent(YN2016ZhenbaogePanel.ZHENBAOGEGOUMAI,"",_data.type));
   }
   
   override protected function createVariableReference() : void
   {
      this.txtName = getChildByName("wenben1") as Label;
      this.txtPrice = getChildByName("wenben2") as Label;
      this.btn = getChildByName("aniu1") as SimpleButton;
      this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
   }
   
   private function createItem() : void
   {
      var newHD:DisplayObject = null;
      var hotHD:DisplayObject = null;
      var g:Goods = new Goods(_data.goodID);
      g.count = _data.count;
      this.item = new ItemFace(g,65,65);
      this.item.x = 35;
      this.item.y = 6;
      addChild(this.item);
      this.txtName.text = g.res.name;
      this.txtPrice.text = LanResManager.getLanCommonTextWords("元宝") + ":" + _data.price;
      if(data.hot == 1)
      {
         newHD = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/longfengdangpu/newHD.swf");
         newHD.x = 35;
         newHD.y = 6;
         addChild(newHD);
         (newHD as Sprite).mouseEnabled = false;
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            var _loc3_:MovieClip = _loc2_.content as MovieClip;
            _loc3_.x = 28;
            _loc3_.y = -7;
            addChild(_loc3_);
         },null,false,GameConfig.fileBaseFolder + "res/ui/UIditu/longfengdangpu/kuang.swf");
      }
      else if(data.hot == 2)
      {
         hotHD = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/longfengdangpu/hotHD.swf");
         hotHD.x = 35;
         hotHD.y = 6;
         addChild(hotHD);
         (hotHD as Sprite).mouseEnabled = false;
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            var _loc3_:MovieClip = _loc2_.content as MovieClip;
            _loc3_.x = 28;
            _loc3_.y = -7;
            addChild(_loc3_);
         },null,false,GameConfig.fileBaseFolder + "res/ui/UIditu/longfengdangpu/kuang.swf");
      }
   }
   
   override public function set data(param1:Object) : void
   {
      _data = param1;
      this.createItem();
   }
}
