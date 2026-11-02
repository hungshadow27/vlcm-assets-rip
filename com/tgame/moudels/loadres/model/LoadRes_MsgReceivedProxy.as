package com.tgame.moudels.loadres.model
{
   import com.tgame.common.GameConfig;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.login.view.*;
   import com.zcp.common.loader.vo.LoadData;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import com.zcp.manager.LoaderManager;
   import com.zcp.manager.RslLoaderManager;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class LoadRes_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Lianti_MsgReceivedProxy";
      
      private var _reloadProxy:LoadRes_ReLoadProxy;
      
      public function LoadRes_MsgReceivedProxy()
      {
         super();
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([53940],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([53940],NAME);
      }
      
      public function get reloadProxy() : LoadRes_ReLoadProxy
      {
         if(this._reloadProxy == null)
         {
            this._reloadProxy = facade.retrieveProxy(LoadRes_ReLoadProxy.NAME) as LoadRes_ReLoadProxy;
         }
         return this._reloadProxy;
      }
      
      private function receivedMsgHandle(param1:Notification) : void
      {
         var _loc2_:* = param1.name;
         var _loc3_:ByteArray = param1.body as ByteArray;
         if(this.hasOwnProperty("received_" + _loc2_))
         {
            this["received_" + _loc2_](_loc3_);
         }
         else
         {
            ZLog.add("协议号" + _loc2_ + "不存在");
         }
      }
      
      public function received_53940(param1:ByteArray) : void
      {
         var _loc6_:String = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:String = null;
         var _loc10_:LoadData = null;
         ZLog.add("53940： 通知客户端文件版本发生变化");
         var _loc2_:int = param1.readShort();
         var _loc3_:Array = [];
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         for(; _loc5_ < _loc2_; _loc5_++)
         {
            _loc6_ = param1.readUTF();
            _loc7_ = param1.readInt();
            _loc8_ = TVersion.getResVersionByKey(_loc6_);
            if(_loc7_ <= _loc8_)
            {
               continue;
            }
            TVersion.addResKeyBaseUrlVersion(_loc6_,TVersion.getResBaseUrlByKey(_loc6_),_loc7_);
            _loc9_ = TVersion.getResUrlByKey(_loc6_);
            switch(_loc6_)
            {
               case "ico":
                  _loc10_ = new LoadData(_loc9_,null,null,null,_loc6_,_loc6_,0,GameConfig.decode);
                  _loc4_.push(_loc10_);
                  break;
               case "lan_font":
               case "lan_notice":
               case "lan_text":
               case "lan_offset":
                  _loc10_ = new LoadData(_loc9_,this.reloadProxy.lan_itemLoadComplete,null,null,"",_loc6_);
                  _loc3_.push(_loc10_);
                  break;
               default:
                  _loc10_ = new LoadData(_loc9_,this.reloadProxy.xml_itemLoadComplete,null,null,"",_loc6_);
                  _loc3_.push(_loc10_);
            }
         }
         if(_loc4_.length > 0)
         {
            RslLoaderManager.load(_loc4_);
         }
         if(_loc3_.length > 0)
         {
            LoaderManager.load(_loc3_);
         }
      }
   }
}

