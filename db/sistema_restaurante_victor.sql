-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-02-2024 a las 19:19:23
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema_restaurante_victor`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarAdmin` (IN `p_ad_id` INT, IN `p_ad_name` VARCHAR(20), IN `p_ad_contact` BIGINT, IN `p_ad_email` VARCHAR(30), IN `p_ad_address` VARCHAR(30), IN `p_ad_username` VARCHAR(20), IN `p_ad_password` VARCHAR(300), IN `p_ad_date` VARCHAR(20))   BEGIN
    UPDATE `admin` SET
        `ad_name` = p_ad_name,
        `ad_contact` = p_ad_contact,
        `ad_email` = p_ad_email,
        `ad_address` = p_ad_address,
        `ad_username` = p_ad_username,
        `ad_password` = p_ad_password,
        `ad_date` = p_ad_date
    WHERE
        `ad_id` = p_ad_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarCargoExtra` (IN `p_ec_id` INT, IN `p_cgst` INT, IN `p_sgst` INT, IN `p_monto_minimo` INT, IN `p_cargos_entrega` INT, IN `p_cant_minima_stock` INT, IN `p_cant_maxima_stock` INT, IN `p_ec_fecha` DATE)   BEGIN
    UPDATE `cargos_extra` SET
        `cgst` = p_cgst,
        `sgst` = p_sgst,
        `monto_minimo` = p_monto_minimo,
        `cargos_entrega` = p_cargos_entrega,
        `cant_minima_stock` = p_cant_minima_stock,
        `cant_maxima_stock` = p_cant_maxima_stock,
        `ec_fecha` = p_ec_fecha
    WHERE
        `ec_id` = p_ec_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarCategoriaProducto` (IN `p_pc_id` INT, IN `p_pc_nombre` VARCHAR(30), IN `p_pc_imagen` VARCHAR(100), IN `p_pc_fecha` VARCHAR(20))   BEGIN
    UPDATE `categoria_producto` SET
        `pc_nombre` = p_pc_nombre,
        `pc_imagen` = p_pc_imagen,
        `pc_fecha` = p_pc_fecha
    WHERE
        `pc_id` = p_pc_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarCliente` (IN `p_cus_id` INT, IN `p_cus_nombre` VARCHAR(20), IN `p_cus_apellido` VARCHAR(20), IN `p_cus_nombre_usuario` VARCHAR(30), IN `p_cus_contacto` BIGINT, IN `p_cus_correo_electronico` VARCHAR(200), IN `p_cus_direccion` VARCHAR(50), IN `p_cus_username` VARCHAR(50), IN `p_cus_password` VARCHAR(300), IN `p_cus_fecha` VARCHAR(20))   BEGIN
    UPDATE `cliente` SET
        `cus_nombre` = p_cus_nombre,
        `cus_apellido` = p_cus_apellido,
        `cus_nombre_usuario` = p_cus_nombre_usuario,
        `cus_contacto` = p_cus_contacto,
        `cus_correo_electronico` = p_cus_correo_electronico,
        `cus_direccion` = p_cus_direccion,
        `cus_username` = p_cus_username,
        `cus_password` = p_cus_password,
        `cus_fecha` = p_cus_fecha
    WHERE
        `cus_id` = p_cus_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarCompraProveedor` (IN `p_sp_id` INT, IN `p_pd_id` INT, IN `p_dea_id` INT, IN `p_cantidad` INT, IN `p_precio_unitario` INT, IN `p_total` INT, IN `p_fecha_compra` VARCHAR(30))   BEGIN
    UPDATE `compra_proveedor` SET
        `pd_id` = p_pd_id,
        `dea_id` = p_dea_id,
        `cantidad` = p_cantidad,
        `precio_unitario` = p_precio_unitario,
        `total` = p_total,
        `fecha_compra` = p_fecha_compra
    WHERE
        `sp_id` = p_sp_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarDetalleCarritoProducto` (IN `p_pcd_id` INT, IN `p_pd_id` INT, IN `p_cus_id` INT, IN `p_pcd_nombre` VARCHAR(20), IN `p_pcd_cantidad` INT, IN `p_pcd_precio` FLOAT, IN `p_pcd_monto_total` FLOAT, IN `p_pcd_numero_pedido` INT, IN `p_pcd_estado` VARCHAR(20), IN `p_pcd_fecha` DATE)   BEGIN
    UPDATE `detalles_carrito_producto` SET
        `pd_id` = p_pd_id,
        `cus_id` = p_cus_id,
        `pcd_nombre` = p_pcd_nombre,
        `pcd_cantidad` = p_pcd_cantidad,
        `pcd_precio` = p_pcd_precio,
        `pcd_monto_total` = p_pcd_monto_total,
        `pcd_numero_pedido` = p_pcd_numero_pedido,
        `pcd_estado` = p_pcd_estado,
        `pcd_fecha` = p_pcd_fecha
    WHERE
        `pcd_id` = p_pcd_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarDetalleInventario` (IN `p_sd_id` INT, IN `p_pd_id` INT, IN `p_sd_precio_unitario` FLOAT, IN `p_sd_cantidad` INT, IN `p_sd_descuento` FLOAT, IN `p_sd_precio_descuento` FLOAT, IN `p_sd_precio_venta` FLOAT, IN `p_sd_estado` VARCHAR(20), IN `p_sd_fecha` VARCHAR(30))   BEGIN
    UPDATE `detalles_inventario` SET
        `pd_id` = p_pd_id,
        `sd_precio_unitario` = p_sd_precio_unitario,
        `sd_cantidad` = p_sd_cantidad,
        `sd_descuento` = p_sd_descuento,
        `sd_precio_descuento` = p_sd_precio_descuento,
        `sd_precio_venta` = p_sd_precio_venta,
        `sd_estado` = p_sd_estado,
        `sd_fecha` = p_sd_fecha
    WHERE
        `sd_id` = p_sd_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarDetalleProducto` (IN `p_pd_id` INT, IN `p_pc_id` INT, IN `p_psc_id` INT, IN `p_pd_nombre` VARCHAR(20), IN `p_pd_descripcion` TEXT, IN `p_pd_precio` FLOAT, IN `p_pd_imagen1` VARCHAR(100), IN `p_pd_fecha` VARCHAR(30))   BEGIN
    UPDATE `detalles_producto` SET
        `pc_id` = p_pc_id,
        `psc_id` = p_psc_id,
        `pd_nombre` = p_pd_nombre,
        `pd_descripcion` = p_pd_descripcion,
        `pd_precio` = p_pd_precio,
        `pd_imagen1` = p_pd_imagen1,
        `pd_fecha` = p_pd_fecha
    WHERE
        `pd_id` = p_pd_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarDistribuidor` (IN `p_dea_id` INT, IN `p_dea_nombre` VARCHAR(30), IN `p_dea_contacto` BIGINT, IN `p_dea_correo_electronico` VARCHAR(50), IN `p_dea_direccion` VARCHAR(50), IN `p_dea_fecha` VARCHAR(20))   BEGIN
    UPDATE `distribuidores` SET
        `dea_nombre` = p_dea_nombre,
        `dea_contacto` = p_dea_contacto,
        `dea_correo_electronico` = p_dea_correo_electronico,
        `dea_direccion` = p_dea_direccion,
        `dea_fecha` = p_dea_fecha
    WHERE
        `dea_id` = p_dea_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarEmpleado` (IN `p_e_id` INT, IN `p_b_id` INT, IN `p_e_nombre` VARCHAR(30), IN `p_e_contacto` BIGINT, IN `p_e_direccion` VARCHAR(50), IN `p_e_correo_electronico` VARCHAR(50), IN `p_e_nombre_usuario` VARCHAR(30), IN `p_e_contrasena` VARCHAR(30), IN `p_e_fecha` VARCHAR(30))   BEGIN
    UPDATE `empleado` SET
        `b_id` = p_b_id,
        `e_nombre` = p_e_nombre,
        `e_contacto` = p_e_contacto,
        `e_direccion` = p_e_direccion,
        `e_correo_electronico` = p_e_correo_electronico,
        `e_nombre_usuario` = p_e_nombre_usuario,
        `e_contrasena` = p_e_contrasena,
        `e_fecha` = p_e_fecha
    WHERE
        `e_id` = p_e_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarFacturaCliente` (IN `p_ci_id` INT, IN `p_cus_id` INT, IN `p_b_id` INT, IN `p_ci_numero_pedido` VARCHAR(50), IN `p_ci_direccion_envio` VARCHAR(100), IN `p_ci_punto_referencia` VARCHAR(100), IN `p_ci_ciudad` VARCHAR(50), IN `p_ci_codigo_postal` INT, IN `p_ci_estados` VARCHAR(50), IN `p_ci_pais` VARCHAR(50), IN `p_ci_cargos_entrega` INT, IN `p_ci_contacto_no` INT, IN `p_ci_fecha` DATE, IN `p_ci_modo_pago` VARCHAR(20), IN `p_ci_numero_transaccion` VARCHAR(50), IN `p_ci_subtotal` FLOAT, IN `p_ci_impuesto` FLOAT, IN `p_ci_descuento_total` FLOAT, IN `p_ci_total_general` FLOAT, IN `p_ci_estado` VARCHAR(20))   BEGIN
    UPDATE `factura_cliente` SET
        `cus_id` = p_cus_id,
        `b_id` = p_b_id,
        `ci_numero_pedido` = p_ci_numero_pedido,
        `ci_direccion_envio` = p_ci_direccion_envio,
        `ci_punto_referencia` = p_ci_punto_referencia,
        `ci_ciudad` = p_ci_ciudad,
        `ci_codigo_postal` = p_ci_codigo_postal,
        `ci_estados` = p_ci_estados,
        `ci_pais` = p_ci_pais,
        `ci_cargos_entrega` = p_ci_cargos_entrega,
        `ci_contacto_no` = p_ci_contacto_no,
        `ci_fecha` = p_ci_fecha,
        `ci_modo_pago` = p_ci_modo_pago,
        `ci_numero_transaccion` = p_ci_numero_transaccion,
        `ci_subtotal` = p_ci_subtotal,
        `ci_impuesto` = p_ci_impuesto,
        `ci_descuento_total` = p_ci_descuento_total,
        `ci_total_general` = p_ci_total_general,
        `ci_estado` = p_ci_estado
    WHERE
        `ci_id` = p_ci_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarFacturaCompraHotel` (IN `p_hpi_id` INT, IN `p_ho_id` INT, IN `p_pd_id` INT, IN `p_precio_unitario` FLOAT, IN `p_cantidad` INT, IN `p_total` FLOAT, IN `p_porcentaje_cgst` FLOAT, IN `p_cgst` FLOAT, IN `p_porcentaje_sgst` FLOAT, IN `p_sgst` FLOAT, IN `p_monto_total` FLOAT, IN `p_fecha` VARCHAR(20))   BEGIN
    UPDATE `factura_compra_hotel` SET
        `ho_id` = p_ho_id,
        `pd_id` = p_pd_id,
        `precio_unitario` = p_precio_unitario,
        `cantidad` = p_cantidad,
        `total` = p_total,
        `porcentaje_cgst` = p_porcentaje_cgst,
        `cgst` = p_cgst,
        `porcentaje_sgst` = p_porcentaje_sgst,
        `sgst` = p_sgst,
        `monto_total` = p_monto_total,
        `fecha` = p_fecha
    WHERE
        `hpi_id` = p_hpi_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarHotel` (IN `p_ho_id` INT, IN `p_ho_nombre` VARCHAR(30), IN `p_ho_contacto` BIGINT, IN `p_ho_direccion` VARCHAR(30), IN `p_ho_fecha` VARCHAR(30))   BEGIN
    UPDATE `hotel` SET
        `ho_nombre` = p_ho_nombre,
        `ho_contacto` = p_ho_contacto,
        `ho_direccion` = p_ho_direccion,
        `ho_fecha` = p_ho_fecha
    WHERE
        `ho_id` = p_ho_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarPagoDiarioHotel` (IN `p_hdp_id` INT, IN `p_ho_id` INT, IN `p_monto_diario` INT, IN `p_hdp_fecha` VARCHAR(30))   BEGIN
    UPDATE `pago_diario_hotel` SET
        `ho_id` = p_ho_id,
        `monto_diario` = p_monto_diario,
        `hdp_fecha` = p_hdp_fecha
    WHERE
        `hdp_id` = p_hdp_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarPagoTotalHotel` (IN `p_htp_id` INT, IN `p_ho_id` INT, IN `p_monto` FLOAT, IN `p_pagado` FLOAT, IN `p_saldo` FLOAT, IN `p_htp_fecha` VARCHAR(30))   BEGIN
    UPDATE `pago_total_hotel` SET
        `ho_id` = p_ho_id,
        `monto` = p_monto,
        `pagado` = p_pagado,
        `saldo` = p_saldo,
        `htp_fecha` = p_htp_fecha
    WHERE
        `htp_id` = p_htp_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarSubcategoriaProducto` (IN `p_psc_id` INT, IN `p_psc_nombre` VARCHAR(30), IN `p_psc_fecha` VARCHAR(20))   BEGIN
    UPDATE `subcategoria_producto` SET
        `psc_nombre` = p_psc_nombre,
        `psc_fecha` = p_psc_fecha
    WHERE
        `psc_id` = p_psc_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarSucursal` (IN `p_b_id` INT, IN `p_b_nombre` VARCHAR(30), IN `p_b_ubicacion` VARCHAR(30), IN `p_b_direccion` VARCHAR(50), IN `p_b_contacto` BIGINT, IN `p_b_fecha` VARCHAR(30))   BEGIN
    UPDATE `sucursal` SET
        `b_nombre` = p_b_nombre,
        `b_ubicacion` = p_b_ubicacion,
        `b_direccion` = p_b_direccion,
        `b_contacto` = p_b_contacto,
        `b_fecha` = p_b_fecha
    WHERE
        `b_id` = p_b_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarTrabajador` (IN `p_worker_id` INT, IN `p_worker_name` VARCHAR(50), IN `p_worker_contact` BIGINT, IN `p_worker_address` VARCHAR(30))   BEGIN
    UPDATE `trabajador` SET
        `worker_name` = p_worker_name,
        `worker_contact` = p_worker_contact,
        `worker_address` = p_worker_address
    WHERE
        `worker_id` = p_worker_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarAdmin` (IN `p_ad_id` INT)   BEGIN
    DELETE FROM `admin` WHERE `ad_id` = p_ad_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarCargoExtra` (IN `p_ec_id` INT)   BEGIN
    DELETE FROM `cargos_extra` WHERE `ec_id` = p_ec_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarCategoriaProducto` (IN `p_pc_id` INT)   BEGIN
    DELETE FROM `categoria_producto` WHERE `pc_id` = p_pc_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarCliente` (IN `p_cus_id` INT)   BEGIN
    DELETE FROM `cliente` WHERE `cus_id` = p_cus_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarCompraProveedor` (IN `p_sp_id` INT)   BEGIN
    DELETE FROM `compra_proveedor` WHERE `sp_id` = p_sp_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarDetalleCarritoProducto` (IN `p_pcd_id` INT)   BEGIN
    DELETE FROM `detalles_carrito_producto` WHERE `pcd_id` = p_pcd_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarDetalleInventario` (IN `p_sd_id` INT)   BEGIN
    DELETE FROM `detalles_inventario` WHERE `sd_id` = p_sd_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarDetalleProducto` (IN `p_pd_id` INT)   BEGIN
    DELETE FROM `detalles_producto` WHERE `pd_id` = p_pd_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarDistribuidor` (IN `p_dea_id` INT)   BEGIN
    DELETE FROM `distribuidores` WHERE `dea_id` = p_dea_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarEmpleado` (IN `p_e_id` INT)   BEGIN
    DELETE FROM `empleado` WHERE `e_id` = p_e_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarFacturaCliente` (IN `p_ci_id` INT)   BEGIN
    DELETE FROM `factura_cliente` WHERE `ci_id` = p_ci_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarFacturaCompraHotel` (IN `p_hpi_id` INT)   BEGIN
    DELETE FROM `factura_compra_hotel` WHERE `hpi_id` = p_hpi_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarHotel` (IN `p_ho_id` INT)   BEGIN
    DELETE FROM `hotel` WHERE `ho_id` = p_ho_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarPagoDiarioHotel` (IN `p_hdp_id` INT)   BEGIN
    DELETE FROM `pago_diario_hotel` WHERE `hdp_id` = p_hdp_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarPagoTotalHotel` (IN `p_htp_id` INT)   BEGIN
    DELETE FROM `pago_total_hotel` WHERE `htp_id` = p_htp_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarSubcategoriaProducto` (IN `p_psc_id` INT)   BEGIN
    DELETE FROM `subcategoria_producto` WHERE `psc_id` = p_psc_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarSucursal` (IN `p_b_id` INT)   BEGIN
    DELETE FROM `sucursal` WHERE `b_id` = p_b_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarTrabajador` (IN `p_worker_id` INT)   BEGIN
    DELETE FROM `trabajador` WHERE `worker_id` = p_worker_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarAdmin` (IN `p_ad_name` VARCHAR(20), IN `p_ad_contact` BIGINT, IN `p_ad_email` VARCHAR(30), IN `p_ad_address` VARCHAR(30), IN `p_ad_username` VARCHAR(20), IN `p_ad_password` VARCHAR(300), IN `p_ad_date` VARCHAR(20))   BEGIN
    INSERT INTO `admin` (
        `ad_name`, `ad_contact`, `ad_email`, 
        `ad_address`, `ad_username`, `ad_password`, `ad_date`
    ) VALUES (
        p_ad_name, p_ad_contact, p_ad_email, 
        p_ad_address, p_ad_username, p_ad_password, p_ad_date
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarCargoExtra` (IN `p_cgst` INT, IN `p_sgst` INT, IN `p_monto_minimo` INT, IN `p_cargos_entrega` INT, IN `p_cant_minima_stock` INT, IN `p_cant_maxima_stock` INT, IN `p_ec_fecha` DATE)   BEGIN
    INSERT INTO `cargos_extra` (
        `cgst`, `sgst`, `monto_minimo`, 
        `cargos_entrega`, `cant_minima_stock`, `cant_maxima_stock`, `ec_fecha`
    ) VALUES (
        p_cgst, p_sgst, p_monto_minimo, 
        p_cargos_entrega, p_cant_minima_stock, p_cant_maxima_stock, p_ec_fecha
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarCategoriaProducto` (IN `p_pc_nombre` VARCHAR(30), IN `p_pc_imagen` VARCHAR(100), IN `p_pc_fecha` VARCHAR(20))   BEGIN
    INSERT INTO `categoria_producto` (
        `pc_nombre`, `pc_imagen`, `pc_fecha`
    ) VALUES (
        p_pc_nombre, p_pc_imagen, p_pc_fecha
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarCliente` (IN `p_cus_nombre` VARCHAR(20), IN `p_cus_apellido` VARCHAR(20), IN `p_cus_nombre_usuario` VARCHAR(30), IN `p_cus_contacto` BIGINT, IN `p_cus_correo_electronico` VARCHAR(200), IN `p_cus_direccion` VARCHAR(50), IN `p_cus_username` VARCHAR(50), IN `p_cus_password` VARCHAR(300), IN `p_cus_fecha` VARCHAR(20))   BEGIN
    INSERT INTO `cliente` (
        `cus_nombre`, `cus_apellido`, `cus_nombre_usuario`,
        `cus_contacto`, `cus_correo_electronico`, `cus_direccion`,
        `cus_username`, `cus_password`, `cus_fecha`
    ) VALUES (
        p_cus_nombre, p_cus_apellido, p_cus_nombre_usuario,
        p_cus_contacto, p_cus_correo_electronico, p_cus_direccion,
        p_cus_username, p_cus_password, p_cus_fecha
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarCompraProveedor` (IN `p_pd_id` INT, IN `p_dea_id` INT, IN `p_cantidad` INT, IN `p_precio_unitario` INT, IN `p_total` INT, IN `p_fecha_compra` VARCHAR(30))   BEGIN
    INSERT INTO `compra_proveedor` (
        `pd_id`, `dea_id`, `cantidad`,
        `precio_unitario`, `total`, `fecha_compra`
    ) VALUES (
        p_pd_id, p_dea_id, p_cantidad,
        p_precio_unitario, p_total, p_fecha_compra
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarDetalleCarritoProducto` (IN `p_pd_id` INT, IN `p_cus_id` INT, IN `p_pcd_nombre` VARCHAR(20), IN `p_pcd_cantidad` INT, IN `p_pcd_precio` FLOAT, IN `p_pcd_monto_total` FLOAT, IN `p_pcd_numero_pedido` INT, IN `p_pcd_estado` VARCHAR(20), IN `p_pcd_fecha` DATE)   BEGIN
    INSERT INTO `detalles_carrito_producto` (
        `pd_id`, `cus_id`, `pcd_nombre`,
        `pcd_cantidad`, `pcd_precio`, `pcd_monto_total`,
        `pcd_numero_pedido`, `pcd_estado`, `pcd_fecha`
    ) VALUES (
        p_pd_id, p_cus_id, p_pcd_nombre,
        p_pcd_cantidad, p_pcd_precio, p_pcd_monto_total,
        p_pcd_numero_pedido, p_pcd_estado, p_pcd_fecha
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarDetalleInventario` (IN `p_pd_id` INT, IN `p_sd_precio_unitario` FLOAT, IN `p_sd_cantidad` INT, IN `p_sd_descuento` FLOAT, IN `p_sd_precio_descuento` FLOAT, IN `p_sd_precio_venta` FLOAT, IN `p_sd_estado` VARCHAR(20), IN `p_sd_fecha` VARCHAR(30))   BEGIN
    INSERT INTO `detalles_inventario` (
        `pd_id`, `sd_precio_unitario`, `sd_cantidad`,
        `sd_descuento`, `sd_precio_descuento`, `sd_precio_venta`,
        `sd_estado`, `sd_fecha`
    ) VALUES (
        p_pd_id, p_sd_precio_unitario, p_sd_cantidad,
        p_sd_descuento, p_sd_precio_descuento, p_sd_precio_venta,
        p_sd_estado, p_sd_fecha
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarDetalleProducto` (IN `p_pc_id` INT, IN `p_psc_id` INT, IN `p_pd_nombre` VARCHAR(20), IN `p_pd_descripcion` TEXT, IN `p_pd_precio` FLOAT, IN `p_pd_imagen1` VARCHAR(100), IN `p_pd_fecha` VARCHAR(30))   BEGIN
    INSERT INTO `detalles_producto` (
        `pc_id`, `psc_id`, `pd_nombre`,
        `pd_descripcion`, `pd_precio`, `pd_imagen1`,
        `pd_fecha`
    ) VALUES (
        p_pc_id, p_psc_id, p_pd_nombre,
        p_pd_descripcion, p_pd_precio, p_pd_imagen1,
        p_pd_fecha
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarDistribuidor` (IN `p_dea_nombre` VARCHAR(30), IN `p_dea_contacto` BIGINT, IN `p_dea_correo_electronico` VARCHAR(50), IN `p_dea_direccion` VARCHAR(50), IN `p_dea_fecha` VARCHAR(20))   BEGIN
    INSERT INTO `distribuidores` (
        `dea_nombre`, `dea_contacto`, `dea_correo_electronico`,
        `dea_direccion`, `dea_fecha`
    ) VALUES (
        p_dea_nombre, p_dea_contacto, p_dea_correo_electronico,
        p_dea_direccion, p_dea_fecha
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarEmpleado` (IN `p_b_id` INT, IN `p_e_nombre` VARCHAR(30), IN `p_e_contacto` BIGINT, IN `p_e_direccion` VARCHAR(50), IN `p_e_correo_electronico` VARCHAR(50), IN `p_e_nombre_usuario` VARCHAR(30), IN `p_e_contrasena` VARCHAR(30), IN `p_e_fecha` VARCHAR(30))   BEGIN
    INSERT INTO `empleado` (
        `b_id`, `e_nombre`, `e_contacto`,
        `e_direccion`, `e_correo_electronico`, `e_nombre_usuario`,
        `e_contrasena`, `e_fecha`
    ) VALUES (
        p_b_id, p_e_nombre, p_e_contacto,
        p_e_direccion, p_e_correo_electronico, p_e_nombre_usuario,
        p_e_contrasena, p_e_fecha
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarFacturaCliente` (IN `p_cus_id` INT, IN `p_b_id` INT, IN `p_ci_numero_pedido` VARCHAR(50), IN `p_ci_direccion_envio` VARCHAR(100), IN `p_ci_punto_referencia` VARCHAR(100), IN `p_ci_ciudad` VARCHAR(50), IN `p_ci_codigo_postal` INT, IN `p_ci_estados` VARCHAR(50), IN `p_ci_pais` VARCHAR(50), IN `p_ci_cargos_entrega` INT, IN `p_ci_contacto_no` INT, IN `p_ci_fecha` DATE, IN `p_ci_modo_pago` VARCHAR(20), IN `p_ci_numero_transaccion` VARCHAR(50), IN `p_ci_subtotal` FLOAT, IN `p_ci_impuesto` FLOAT, IN `p_ci_descuento_total` FLOAT, IN `p_ci_total_general` FLOAT, IN `p_ci_estado` VARCHAR(20))   BEGIN
    INSERT INTO `factura_cliente` (
        `cus_id`, `b_id`, `ci_numero_pedido`,
        `ci_direccion_envio`, `ci_punto_referencia`, `ci_ciudad`,
        `ci_codigo_postal`, `ci_estados`, `ci_pais`,
        `ci_cargos_entrega`, `ci_contacto_no`, `ci_fecha`,
        `ci_modo_pago`, `ci_numero_transaccion`, `ci_subtotal`,
        `ci_impuesto`, `ci_descuento_total`, `ci_total_general`,
        `ci_estado`
    ) VALUES (
        p_cus_id, p_b_id, p_ci_numero_pedido,
        p_ci_direccion_envio, p_ci_punto_referencia, p_ci_ciudad,
        p_ci_codigo_postal, p_ci_estados, p_ci_pais,
        p_ci_cargos_entrega, p_ci_contacto_no, p_ci_fecha,
        p_ci_modo_pago, p_ci_numero_transaccion, p_ci_subtotal,
        p_ci_impuesto, p_ci_descuento_total, p_ci_total_general,
        p_ci_estado
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarFacturaCompraHotel` (IN `p_ho_id` INT, IN `p_pd_id` INT, IN `p_precio_unitario` FLOAT, IN `p_cantidad` INT, IN `p_total` FLOAT, IN `p_porcentaje_cgst` FLOAT, IN `p_cgst` FLOAT, IN `p_porcentaje_sgst` FLOAT, IN `p_sgst` FLOAT, IN `p_monto_total` FLOAT, IN `p_fecha` VARCHAR(20))   BEGIN
    INSERT INTO `factura_compra_hotel` (
        `ho_id`, `pd_id`, `precio_unitario`,
        `cantidad`, `total`, `porcentaje_cgst`,
        `cgst`, `porcentaje_sgst`, `sgst`,
        `monto_total`, `fecha`
    ) VALUES (
        p_ho_id, p_pd_id, p_precio_unitario,
        p_cantidad, p_total, p_porcentaje_cgst,
        p_cgst, p_porcentaje_sgst, p_sgst,
        p_monto_total, p_fecha
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarHotel` (IN `p_ho_nombre` VARCHAR(30), IN `p_ho_contacto` BIGINT, IN `p_ho_direccion` VARCHAR(30), IN `p_ho_fecha` VARCHAR(30))   BEGIN
    INSERT INTO `hotel` (
        `ho_nombre`, `ho_contacto`, `ho_direccion`, `ho_fecha`
    ) VALUES (
        p_ho_nombre, p_ho_contacto, p_ho_direccion, p_ho_fecha
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarPagoDiarioHotel` (IN `p_ho_id` INT, IN `p_monto_diario` INT, IN `p_hdp_fecha` VARCHAR(30))   BEGIN
    INSERT INTO `pago_diario_hotel` (
        `ho_id`, `monto_diario`, `hdp_fecha`
    ) VALUES (
        p_ho_id, p_monto_diario, p_hdp_fecha
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarPagoTotalHotel` (IN `p_ho_id` INT, IN `p_monto` FLOAT, IN `p_pagado` FLOAT, IN `p_saldo` FLOAT, IN `p_htp_fecha` VARCHAR(30))   BEGIN
    INSERT INTO `pago_total_hotel` (
        `ho_id`, `monto`, `pagado`, `saldo`, `htp_fecha`
    ) VALUES (
        p_ho_id, p_monto, p_pagado, p_saldo, p_htp_fecha
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarSubcategoriaProducto` (IN `p_psc_nombre` VARCHAR(30), IN `p_psc_fecha` VARCHAR(20))   BEGIN
    INSERT INTO `subcategoria_producto` (
        `psc_nombre`, `psc_fecha`
    ) VALUES (
        p_psc_nombre, p_psc_fecha
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarSucursal` (IN `p_b_nombre` VARCHAR(30), IN `p_b_ubicacion` VARCHAR(30), IN `p_b_direccion` VARCHAR(50), IN `p_b_contacto` BIGINT, IN `p_b_fecha` VARCHAR(30))   BEGIN
    INSERT INTO `sucursal` (
        `b_nombre`, `b_ubicacion`, `b_direccion`, `b_contacto`, `b_fecha`
    ) VALUES (
        p_b_nombre, p_b_ubicacion, p_b_direccion, p_b_contacto, p_b_fecha
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarTrabajador` (IN `p_worker_name` VARCHAR(50), IN `p_worker_contact` BIGINT, IN `p_worker_address` VARCHAR(30))   BEGIN
    INSERT INTO `trabajador` (
        `worker_name`, `worker_contact`, `worker_address`
    ) VALUES (
        p_worker_name, p_worker_contact, p_worker_address
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MostrarAdmin` ()   BEGIN
    SELECT * FROM `admin`;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MostrarCargosExtra` ()   BEGIN
    SELECT * FROM `cargos_extra`;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MostrarCategoriasProducto` ()   BEGIN
    SELECT * FROM `categoria_producto`;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MostrarClientes` ()   BEGIN
    SELECT * FROM `cliente`;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MostrarComprasProveedor` ()   BEGIN
    SELECT * FROM `compra_proveedor`;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MostrarDetallesCarritoProducto` ()   BEGIN
    SELECT * FROM `detalles_carrito_producto`;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MostrarDetallesInventario` ()   BEGIN
    SELECT * FROM `detalles_inventario`;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MostrarDetallesProducto` ()   BEGIN
    SELECT * FROM `detalles_producto`;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MostrarDistribuidores` ()   BEGIN
    SELECT * FROM `distribuidores`;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MostrarEmpleados` ()   BEGIN
    SELECT * FROM `empleado`;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MostrarFacturasCliente` ()   BEGIN
    SELECT * FROM `factura_cliente`;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MostrarFacturasCompraHotel` ()   BEGIN
    SELECT * FROM `factura_compra_hotel`;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MostrarHoteles` ()   BEGIN
    SELECT * FROM `hotel`;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MostrarPagosDiariosHotel` ()   BEGIN
    SELECT * FROM `pago_diario_hotel`;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MostrarPagosTotalesHotel` ()   BEGIN
    SELECT * FROM `pago_total_hotel`;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MostrarSubcategoriasProducto` ()   BEGIN
    SELECT * FROM `subcategoria_producto`;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MostrarSucursales` ()   BEGIN
    SELECT * FROM `sucursal`;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MostrarTrabajadores` ()   BEGIN
    SELECT * FROM `trabajador`;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerClientePorUsuario` (IN `p_cus_username` VARCHAR(50))   BEGIN
    SELECT
        cus_id,
        cus_nombre,
        cus_apellido,
        CONCAT(cus_nombre, ' ', cus_apellido) AS cus_name,
        cus_contacto,
        cus_correo_electronico,
        cus_direccion,
        cus_username,
        cus_password
    FROM cliente
    WHERE cus_username = p_cus_username;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ValidarAdmin` (IN `p_ad_username` VARCHAR(20), IN `p_ad_password` VARCHAR(300), OUT `p_valid` INT)   BEGIN
    DECLARE ad_id INT;
    DECLARE stored_password VARCHAR(300);

    SELECT ad_id, ad_password INTO ad_id, stored_password
    FROM admin
    WHERE ad_username = p_ad_username;

    IF ad_id IS NOT NULL AND p_ad_password = stored_password THEN
        SET p_valid = 1;
    ELSE
        SET p_valid = 0;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ValidateCustomerLogin` (IN `p_customer_username` VARCHAR(30), IN `p_customer_password` VARCHAR(300), OUT `p_is_valid` INT, OUT `p_customer_id` INT)   BEGIN
    DECLARE stored_password VARCHAR(300);

    SELECT cus_id, cus_password INTO p_customer_id, stored_password
    FROM cliente
    WHERE cus_username = p_customer_username;

    IF stored_password IS NOT NULL AND p_customer_password = stored_password THEN
        SET p_is_valid = 1;
    ELSE
        SET p_is_valid = 0;
    END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `ad_id` int(11) NOT NULL,
  `ad_name` varchar(20) NOT NULL,
  `ad_contact` bigint(20) NOT NULL,
  `ad_email` varchar(30) NOT NULL,
  `ad_address` varchar(30) NOT NULL,
  `ad_username` varchar(20) NOT NULL,
  `ad_password` varchar(300) NOT NULL,
  `ad_date` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `admin`
--

INSERT INTO `admin` (`ad_id`, `ad_name`, `ad_contact`, `ad_email`, `ad_address`, `ad_username`, `ad_password`, `ad_date`) VALUES
(1, 'Dylan', 8660557946, 'praveen@gmail.com', 'hubli', 'dylan24', '827ccb0eea8a706c4c34a16891f84e7b', '2020-03-03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos_extra`
--

CREATE TABLE `cargos_extra` (
  `ec_id` int(11) NOT NULL,
  `cgst` int(11) NOT NULL,
  `sgst` int(11) NOT NULL,
  `monto_minimo` int(11) NOT NULL,
  `cargos_entrega` int(11) NOT NULL,
  `cant_minima_stock` int(11) NOT NULL,
  `cant_maxima_stock` int(11) NOT NULL,
  `ec_fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_producto`
--

CREATE TABLE `categoria_producto` (
  `pc_id` int(20) NOT NULL,
  `pc_nombre` varchar(30) NOT NULL,
  `pc_imagen` varchar(100) NOT NULL,
  `pc_fecha` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `categoria_producto`
--

INSERT INTO `categoria_producto` (`pc_id`, `pc_nombre`, `pc_imagen`, `pc_fecha`) VALUES
(21, 'Postres', 'IMG_1771803195.jpg', '01-02-2024');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `cus_id` int(30) NOT NULL,
  `cus_nombre` varchar(20) NOT NULL,
  `cus_apellido` varchar(20) NOT NULL,
  `cus_nombre_usuario` varchar(30) NOT NULL,
  `cus_contacto` bigint(20) NOT NULL,
  `cus_correo_electronico` varchar(200) NOT NULL,
  `cus_direccion` varchar(50) NOT NULL,
  `cus_username` varchar(50) NOT NULL,
  `cus_password` varchar(300) NOT NULL,
  `cus_fecha` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`cus_id`, `cus_nombre`, `cus_apellido`, `cus_nombre_usuario`, `cus_contacto`, `cus_correo_electronico`, `cus_direccion`, `cus_username`, `cus_password`, `cus_fecha`) VALUES
(35, 'jose', 'guaraca', 'jose guaraca', 985468742, 'jose@gmail.com', 'lican barrio sur israel', 'josep123', 'RW5lcm8wMyo=', '30-01-2024'),
(36, 'miguel', 'guaraca', 'miguel guaraca', 989594950, 'miguelg@gmail.com', 'lican barrio sur israel', 'miguel12', 'RGljaWVtYnJlMDY=', '30-01-2024'),
(37, 'juanito', 'garces', 'juanito garces', 2944318, 'juanito@gmail.com', 'avenida los alamos', 'jaunito12', 'VXN1YXJpb251bWVyMQ==', '31-01-2024'),
(38, 'rivaldo', 'gomez', 'rivaldo gomez', 29443198, 'rivaldo12', 'lican urdesas del sur ', 'rivaldo12', 'VXN1YXJpb251bWVybzI=', '31-01-2024');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_proveedor`
--

CREATE TABLE `compra_proveedor` (
  `sp_id` int(11) NOT NULL,
  `pd_id` int(11) NOT NULL,
  `dea_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `fecha_compra` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_carrito_producto`
--

CREATE TABLE `detalles_carrito_producto` (
  `pcd_id` int(11) NOT NULL,
  `pd_id` int(11) NOT NULL,
  `cus_id` int(11) NOT NULL,
  `pcd_nombre` varchar(20) NOT NULL,
  `pcd_cantidad` int(10) NOT NULL,
  `pcd_precio` float NOT NULL,
  `pcd_monto_total` float NOT NULL,
  `pcd_numero_pedido` int(30) NOT NULL,
  `pcd_estado` varchar(20) NOT NULL,
  `pcd_fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_inventario`
--

CREATE TABLE `detalles_inventario` (
  `sd_id` int(11) NOT NULL,
  `pd_id` int(11) NOT NULL,
  `sd_precio_unitario` float NOT NULL,
  `sd_cantidad` int(30) NOT NULL,
  `sd_descuento` float NOT NULL,
  `sd_precio_descuento` float NOT NULL,
  `sd_precio_venta` float NOT NULL,
  `sd_estado` varchar(20) NOT NULL,
  `sd_fecha` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `detalles_inventario`
--

INSERT INTO `detalles_inventario` (`sd_id`, `pd_id`, `sd_precio_unitario`, `sd_cantidad`, `sd_descuento`, `sd_precio_descuento`, `sd_precio_venta`, `sd_estado`, `sd_fecha`) VALUES
(49, 27, 1, 1, 5, 0, 0, 'Available', '01-02-2024');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_producto`
--

CREATE TABLE `detalles_producto` (
  `pd_id` int(20) NOT NULL,
  `pc_id` int(20) NOT NULL,
  `psc_id` int(20) NOT NULL,
  `pd_nombre` varchar(20) NOT NULL,
  `pd_descripcion` text NOT NULL,
  `pd_precio` float NOT NULL,
  `pd_imagen1` varchar(100) NOT NULL,
  `pd_fecha` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `detalles_producto`
--

INSERT INTO `detalles_producto` (`pd_id`, `pc_id`, `psc_id`, `pd_nombre`, `pd_descripcion`, `pd_precio`, `pd_imagen1`, `pd_fecha`) VALUES
(27, 21, 4, 'rico helado conito', 'deliciosos', 2, 'IMG_1232273313.jpg', '01-02-2024');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distribuidores`
--

CREATE TABLE `distribuidores` (
  `dea_id` int(11) NOT NULL,
  `dea_nombre` varchar(30) NOT NULL,
  `dea_contacto` bigint(20) NOT NULL,
  `dea_correo_electronico` varchar(50) NOT NULL,
  `dea_direccion` varchar(50) NOT NULL,
  `dea_fecha` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `e_id` int(20) NOT NULL,
  `b_id` int(30) NOT NULL,
  `e_nombre` varchar(30) NOT NULL,
  `e_contacto` bigint(20) NOT NULL,
  `e_direccion` varchar(50) NOT NULL,
  `e_correo_electronico` varchar(50) NOT NULL,
  `e_nombre_usuario` varchar(30) NOT NULL,
  `e_contrasena` varchar(30) NOT NULL,
  `e_fecha` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`e_id`, `b_id`, `e_nombre`, `e_contacto`, `e_direccion`, `e_correo_electronico`, `e_nombre_usuario`, `e_contrasena`, `e_fecha`) VALUES
(5, 1, 'victor', 9741804715, '                hubli', 'pk@gmail.com', 'victor1', '12345', '30-08-2020');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_cliente`
--

CREATE TABLE `factura_cliente` (
  `ci_id` int(11) NOT NULL,
  `cus_id` int(11) NOT NULL,
  `b_id` int(11) NOT NULL,
  `ci_numero_pedido` varchar(50) NOT NULL,
  `ci_direccion_envio` varchar(100) NOT NULL,
  `ci_punto_referencia` varchar(100) NOT NULL,
  `ci_ciudad` varchar(50) NOT NULL,
  `ci_codigo_postal` int(6) NOT NULL,
  `ci_estados` varchar(50) NOT NULL,
  `ci_pais` varchar(50) NOT NULL,
  `ci_cargos_entrega` int(11) NOT NULL,
  `ci_contacto_no` int(20) NOT NULL,
  `ci_fecha` date NOT NULL,
  `ci_modo_pago` varchar(20) NOT NULL,
  `ci_numero_transaccion` varchar(50) NOT NULL,
  `ci_subtotal` float NOT NULL,
  `ci_impuesto` float NOT NULL,
  `ci_descuento_total` float NOT NULL,
  `ci_total_general` float NOT NULL,
  `ci_estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_compra_hotel`
--

CREATE TABLE `factura_compra_hotel` (
  `hpi_id` int(11) NOT NULL,
  `ho_id` int(11) NOT NULL,
  `pd_id` int(11) NOT NULL,
  `precio_unitario` float NOT NULL,
  `cantidad` int(11) NOT NULL,
  `total` float NOT NULL,
  `porcentaje_cgst` float NOT NULL,
  `cgst` float NOT NULL,
  `porcentaje_sgst` float NOT NULL,
  `sgst` float NOT NULL,
  `monto_total` float NOT NULL,
  `fecha` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hotel`
--

CREATE TABLE `hotel` (
  `ho_id` int(20) NOT NULL,
  `ho_nombre` varchar(30) NOT NULL,
  `ho_contacto` bigint(20) NOT NULL,
  `ho_direccion` varchar(30) NOT NULL,
  `ho_fecha` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago_diario_hotel`
--

CREATE TABLE `pago_diario_hotel` (
  `hdp_id` int(11) NOT NULL,
  `ho_id` int(11) NOT NULL,
  `monto_diario` int(11) NOT NULL,
  `hdp_fecha` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago_total_hotel`
--

CREATE TABLE `pago_total_hotel` (
  `htp_id` int(11) NOT NULL,
  `ho_id` int(11) NOT NULL,
  `monto` float NOT NULL,
  `pagado` float NOT NULL,
  `saldo` float NOT NULL,
  `htp_fecha` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategoria_producto`
--

CREATE TABLE `subcategoria_producto` (
  `psc_id` int(20) NOT NULL,
  `psc_nombre` varchar(30) NOT NULL,
  `psc_fecha` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `subcategoria_producto`
--

INSERT INTO `subcategoria_producto` (`psc_id`, `psc_nombre`, `psc_fecha`) VALUES
(4, 'Helados', '01-02-2024');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE `sucursal` (
  `b_id` int(20) NOT NULL,
  `b_nombre` varchar(30) NOT NULL,
  `b_ubicacion` varchar(30) NOT NULL,
  `b_direccion` varchar(50) NOT NULL,
  `b_contacto` bigint(20) NOT NULL,
  `b_fecha` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajador`
--

CREATE TABLE `trabajador` (
  `worker_id` int(11) NOT NULL,
  `worker_name` varchar(50) NOT NULL,
  `worker_contact` bigint(50) NOT NULL,
  `worker_address` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `trabajador`
--

INSERT INTO `trabajador` (`worker_id`, `worker_name`, `worker_contact`, `worker_address`) VALUES
(3, 'Juan', 7406251264, 'Lican'),
(4, 'Miguel', 9986960718, 'Politecnica');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ad_id`);

--
-- Indices de la tabla `cargos_extra`
--
ALTER TABLE `cargos_extra`
  ADD PRIMARY KEY (`ec_id`);

--
-- Indices de la tabla `categoria_producto`
--
ALTER TABLE `categoria_producto`
  ADD PRIMARY KEY (`pc_id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cus_id`);

--
-- Indices de la tabla `compra_proveedor`
--
ALTER TABLE `compra_proveedor`
  ADD PRIMARY KEY (`sp_id`);

--
-- Indices de la tabla `detalles_carrito_producto`
--
ALTER TABLE `detalles_carrito_producto`
  ADD PRIMARY KEY (`pcd_id`);

--
-- Indices de la tabla `detalles_inventario`
--
ALTER TABLE `detalles_inventario`
  ADD PRIMARY KEY (`sd_id`);

--
-- Indices de la tabla `detalles_producto`
--
ALTER TABLE `detalles_producto`
  ADD PRIMARY KEY (`pd_id`);

--
-- Indices de la tabla `distribuidores`
--
ALTER TABLE `distribuidores`
  ADD PRIMARY KEY (`dea_id`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`e_id`);

--
-- Indices de la tabla `factura_cliente`
--
ALTER TABLE `factura_cliente`
  ADD PRIMARY KEY (`ci_id`);

--
-- Indices de la tabla `factura_compra_hotel`
--
ALTER TABLE `factura_compra_hotel`
  ADD PRIMARY KEY (`hpi_id`);

--
-- Indices de la tabla `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`ho_id`);

--
-- Indices de la tabla `pago_diario_hotel`
--
ALTER TABLE `pago_diario_hotel`
  ADD PRIMARY KEY (`hdp_id`);

--
-- Indices de la tabla `pago_total_hotel`
--
ALTER TABLE `pago_total_hotel`
  ADD PRIMARY KEY (`htp_id`);

--
-- Indices de la tabla `subcategoria_producto`
--
ALTER TABLE `subcategoria_producto`
  ADD PRIMARY KEY (`psc_id`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`b_id`);

--
-- Indices de la tabla `trabajador`
--
ALTER TABLE `trabajador`
  ADD PRIMARY KEY (`worker_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin`
--
ALTER TABLE `admin`
  MODIFY `ad_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `cargos_extra`
--
ALTER TABLE `cargos_extra`
  MODIFY `ec_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `categoria_producto`
--
ALTER TABLE `categoria_producto`
  MODIFY `pc_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `cus_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `compra_proveedor`
--
ALTER TABLE `compra_proveedor`
  MODIFY `sp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `detalles_carrito_producto`
--
ALTER TABLE `detalles_carrito_producto`
  MODIFY `pcd_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT de la tabla `detalles_inventario`
--
ALTER TABLE `detalles_inventario`
  MODIFY `sd_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `detalles_producto`
--
ALTER TABLE `detalles_producto`
  MODIFY `pd_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `distribuidores`
--
ALTER TABLE `distribuidores`
  MODIFY `dea_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `e_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `factura_cliente`
--
ALTER TABLE `factura_cliente`
  MODIFY `ci_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de la tabla `factura_compra_hotel`
--
ALTER TABLE `factura_compra_hotel`
  MODIFY `hpi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `hotel`
--
ALTER TABLE `hotel`
  MODIFY `ho_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `pago_diario_hotel`
--
ALTER TABLE `pago_diario_hotel`
  MODIFY `hdp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `pago_total_hotel`
--
ALTER TABLE `pago_total_hotel`
  MODIFY `htp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `subcategoria_producto`
--
ALTER TABLE `subcategoria_producto`
  MODIFY `psc_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  MODIFY `b_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `trabajador`
--
ALTER TABLE `trabajador`
  MODIFY `worker_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
