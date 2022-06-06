#!/bin/sh -l

xmllint --schematron mule-flow.sch ./sumup-purchase-orders-sps-sapi/src/main/mule/flows/*.xml 
